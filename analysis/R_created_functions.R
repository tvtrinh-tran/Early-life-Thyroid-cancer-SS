
###Create functions that I'll use in the codes in Early life project

#1. Function for descriptive info
descript_table = function(var_name, var_label,data)
{
  Descriptive_table = data[,-1]   |>
    tbl_summary(
      include = var_name,
      type = all_continuous() ~ "continuous",
      statistic = list(
        all_continuous()
        ~ c("{median} ({p25}, {p75})"),
        all_categorical() ~ "{n} ({p}%)"
      ),
      label = var_label,
      digits = list(
        all_continuous() ~ 1,
        all_categorical() ~ c(0,1)
      ),
      missing = "ifany"
    )  |>
    
    modify_footnote(all_stat_cols() ~ NA)
  return(Descriptive_table)
}


#2. Function for cox models
cox_model = function(surv, var_name, var_label, covar, data, model_name=NULL)
{
  results_cox_function = map2(
    .x = var_name,
    .y = var_label,
    ~ #add a condition to not adjust for baseline smoking status if the variables of interest are "Age started smoking"
      (if (.x %in% smok) {
        reformulate(c(.x, covar[!covar == "smok_status"]), response = surv)
      } else {
        reformulate(c(.x, covar), response = surv)
      }) |>
      coxph(method = "breslow", data = data) |>
      tbl_regression(
        exponentiate = TRUE,
        conf.int = TRUE,
        conf.level = 0.95,
        add_estimate_to_reference_rows = TRUE,
        label = .y,
        include = .x
      ) |>
      modify_fmt_fun(estimate ~ function(x)
        ifelse(is.na(x), NA, "—"),
        rows = n_event == "0") |>
      modify_fmt_fun(ci ~ function(x)
        ifelse(is.na(x), NA, "—"),
        rows = n_event == "0")
    
  ) |>
    tbl_stack() |>
    modify_column_hide(p.value) |>
    modify_header(n_event ~ "**Number of events**",
                  exposure ~ "**Person-years**",
                  estimate ~ "**HR**") |>
    modify_table_body(~ .x |> dplyr::relocate(exposure, .before = estimate))
  
  if (!is.null(model_name)) {
    results_cox_function = results_cox_function |>   modify_spanning_header(c(n_event, exposure, estimate, ci) ~
                                                                              paste0("**", model_name, "**"))
  }
  return(results_cox_function)
  rm(results_cox_function)
}


#3 Stratified analyses (wide)


stratification_wide = function(strat_var,
                          surv,
                          var_name,
                          var_label,
                          covar,
                          data)
{
  data = data |> 
    filter({{strat_var}}!="Unknown")|>droplevels()
  
  # Extract unique levels from the stratification variable
  unique_levels = data |> select({{strat_var}}) |>
    summarise_each(list( ~ levels(.))) |>
    pull() |> as.factor()
  
  
  header = substring(unique_levels,4)
  header = paste("**", header, "**",sep="")
  
  
  # Use purrr::map to create a list of stratified data frames and appy the function cox_model on them
  results = unique_levels |>
    map(
      ~ data |>
        filter({{strat_var}} == .x) |>
        cox_model(surv = surv,
                  var_name = var_name,
                  var_label = var_label,
                  covar = covar
        )
    ) |>
    tbl_merge(tab_spanner = header)
  return(results)
  rm(results)
}

#4.1 Stratified analyses (long for continuous variables)


 stratification_long = function(strat_var,
                                surv,
                                var_name,
                                var_label,
                                covar,
                                data)
 {
   data = data |> 
     filter({{strat_var}}!="Unknown")|>droplevels()
   
   # Extract unique levels from the stratification variable
   unique_levels = data |> select({{strat_var}}) |>
     summarise_each(list( ~ levels(.))) |>
     pull() |> as.factor()
   
   
   header = substring(unique_levels,4)
   header = paste("**", header, "**",sep="")
   
   
   # Use purrr::map to create a list of stratified data frames and appy the function cox_model on them
   results = unique_levels |>
     map(
       ~ data |>
         filter({{strat_var}} == .x) |>
         cox_model(surv = surv,
                   var_name = var_name,
                   var_label = var_label,
                   covar = covar
         )) |>
     tbl_stack()|>modify_table_body(~ .x |> dplyr::mutate(label = unique_levels))
   return(results)
   rm(results)
 }


#4.2 Stratified analyses (long for categorical variables)

stratification_long_cat = function(strat_var,
                                   surv,
                                   var_name,
                                   var_label,
                                   cat=NULL,
                                   covar,
                                   data)
{
  data = data |> 
    filter({{strat_var}}!="Unknown")|>droplevels()
  
  # Extract unique levels from the stratification variable
  unique_levels = data |> select({{strat_var}}) |>
    summarise_each(list( ~ levels(.))) |>
    pull() |> as.factor()
  
  
  header = substring(unique_levels,4)
  header = paste("**", header, "**",sep="")
  
  
  # Use purrr::map to create a list of stratified data frames and appy the function cox_model on them
  results = unique_levels |>
    map(~ {
      # Filter data based on the current level of the categorical variable
      label = as.character(.x)
      filtered_data <- data |>
        filter({{strat_var}} == .x)
      
      # Apply cox_model function to the filtered data
      cox_model_results <- cox_model(filtered_data,
                                     surv = surv,
                                     var_name = var_name,
                                     var_label = var_label,
                                     covar = covar)
      
      # Modify table body based on the cox_model results
      cox_model_results$table_body$label[1]= label
      
      return(cox_model_results)
    }) |>
    tbl_stack()|> 
    #modify_table_body(filter, is.na(n_event) | label %in% cat)|>
    modify_column_hide(exposure)
  return(results)
  rm(results)
}

stratification_long_for_a_list = function(var_name,
                                          var_label,
                                          strat_list,
                                          surv,
                                          covar,
                                          data) {
  results_list <- list()
  for (strat in strat_list) {
    strat=as.character(strat)
    strat_label=strat[3]
    strat_var=as.name(strat[2])
    # Call the stratification_long_cat function with the current strat_var
    result <- stratification_long_cat(
      strat_var = {
        {
          strat_var
        }
      },
      surv = "Surv(ident_ageexact_bl, ident_EOF, ident_DTC)",
      var_name = var_name,
      var_label = var_label,
      covar = covariates_childhood,
      data = earlylife_popu
    ) |> modify_table_body(~ .x  |>
                             dplyr::add_row(label = strat_label,
                                            .before = 0)|>dplyr::add_row(label = ""))
    
    # Store the result in the results_list
    results_list[[as.character(strat_var)]] <- result
  }
  
  final_result = tbl_stack(results_list)
  return(final_result)
}

#5. Function for competing risk models

competing_risk_model = function(surv, var_name, var_label, covar, data, model_name = NULL)
{
  competing = function(x, y)
  {
    formula = reformulate(c(x, covar), response = "Surv(fgstart, fgstop, fgstatus)")
    finegray_data = reformulate(c(x, covar), response = surv) |>
      finegray(id = PSID, data = data)
    fine_gray = coxph(formula, weight = fgwt, finegray_data) |>
      tbl_regression(
        exponentiate = TRUE,
        conf.int = TRUE,
        conf.level = 0.95,
        add_estimate_to_reference_rows = TRUE,
        label = y,
        include = x
      )|>
      modify_fmt_fun(estimate ~ function(x)
        ifelse(is.na(x), NA, "—"),
        rows = n_event == "0") |>
      modify_fmt_fun(ci ~ function(x)
        ifelse(is.na(x), NA, "—"),
        rows = n_event == "0") 
  }
  
  results_competing_risk_function <-
    map2(.x = var_name, .y = var_label, competing) |>
    tbl_stack() |>
    modify_column_hide(p.value) |>
    modify_header(n_event ~ "**Number of events**",
                  exposure ~ "**Person-years**",
                  estimate ~ "**HR**") |>
    modify_table_body(~ .x |> dplyr::relocate(exposure, .before = estimate))
  
  if (!is.null(model_name)) {
    results_competing_risk_function = results_competing_risk_function |>   modify_spanning_header(c(n_event, exposure, estimate, ci) ~
                                                                              paste0("**", model_name, "**"))
  }
  return(results_competing_risk_function)
  rm(results_competing_risk_function)
}

#6. function to sort ui_birth_weight properly
sort_birth_weight = function(table) {table|>
  modify_table_body( ~.x |>
                       dplyr::mutate(sort = 1:nrow(.x)) |>
                       dplyr::mutate(sort = if_else(label == "Between 2500 and 3999 g",
                                                    sort + 1,
                                                    if_else(label =="< 2500 g", sort - 1, sort)
                       )) |> arrange(sort))
}
#7 function to sort properly rep_br_dev_age_cat, rep_age_menarche_cat, an_weight_age10, an_height_age10, an_weight_teen, ses_income_child
sort_childhood = function(table) {table|>
    modify_table_body( ~.x |>
                         dplyr::mutate(sort = 1:nrow(.x)) |>
                         dplyr::mutate(sort = if_else(label == "11-13 years of age",  sort + 1,
                                                      if_else(label =="Less than 11 years of age", sort - 1, sort)))|>
                         dplyr::mutate(sort = if_else(label == "12-14 years of age",  sort + 1,
                                                      if_else(label =="Less than 12 years of age", sort - 1, sort)))|>
                         dplyr::mutate(sort = if_else(label == "Same weight",  sort + 1,
                                                      if_else(label =="Lighter", sort - 1, sort)))|>
                         dplyr::mutate(sort = if_else(label == "Same height",  sort + 1,
                                                      if_else(label =="Shorter", sort - 1, sort)))|>
                         dplyr::mutate(sort = if_else(label == "Middle income",  sort + 1,
                                                      if_else(label =="Well off", sort - 1, sort))) |> 
                         arrange(sort))
}

sort_childhood_not_gtsummary = function(table) {table|>
                         dplyr::mutate(sort = 1:nrow(table)) |>
                         dplyr::mutate(sort = if_else(label == "11-13 years of age",  sort + 1,
                                                      if_else(label =="Less than 11 years of age", sort - 1, sort)))|>
                         dplyr::mutate(sort = if_else(label == "12-14 years of age",  sort + 1,
                                                      if_else(label =="Less than 12 years of age", sort - 1, sort)))|>
                         dplyr::mutate(sort = if_else(label == "Same weight",  sort + 1,
                                                      if_else(label =="Lighter", sort - 1, sort)))|>
                         dplyr::mutate(sort = if_else(label == "Same height",  sort + 1,
                                                      if_else(label =="Shorter", sort - 1, sort)))|>
                         dplyr::mutate(sort = if_else(label == "Middle income",  sort + 1,
                                                      if_else(label =="Well off", sort - 1, sort))) |> 
                         arrange(sort)
}
#8 Polish tables for in utero paper
polish_utero = function(data, group_name = FALSE) 
{
  #polish the table
  if (group_name==TRUE)
  {  
  data = data |>
    modify_table_body(
      ~ .x  |>
        dplyr::add_row(
          label = "Maternal pregnancy characteristics",
          .before = grep("ui_diab_all_mother", data$table_body$variable)
        )  |>
        dplyr::add_row(
          label = "Paternal pregnancy characteristics",
          .before = grep("ui_diab_father", data$table_body$variable) + 1
        )  |>
        dplyr::add_row(
          label = "Birth and infancy characteristics",
          .before = grep("ui_birth_weight_cat", data$table_body$variable) + 2
        )
    ) 
  
  data = data |>
    modify_table_styling(
      column = "label",
      rows = data$table_body$label %in% c(
        "Participant characteristics at baseline",
        "Maternal pregnancy characteristics",
        "Paternal pregnancy characteristics",
        "Birth and infancy characteristics"
      ),
      text_format = "bold"
    ) 
  }
  data = modify_footnote(data,
                         abbreviation = TRUE)|>
    as_gt() |> tab_footnote(footnote = "Multivariable models were adjusted for attained age (timescale), and self-identified race/ethnicity")
  return(data)
}

#9 Polish tables for childhood paper
polish_childhood = function(data, group_name = FALSE) 
{
  #polish the table
  if (group_name==TRUE)
  {  
    data = data |>
    modify_table_body(
      ~ .x  |>
        dplyr::add_row(
          label = "Growth and reproductive factors",
          .before = grep("an_weight_age10", data$table_body$variable)
        )  |>
        dplyr::add_row(
          label = "Lifestyle factors",
          .before = grep("ph_MET_wk_before20_cat", data$table_body$variable) + 1
        )  |>
        dplyr::add_row(
          label = "Socioeconomic factors",
          .before = grep("ses_income_child", data$table_body$variable) + 2
        ) |>
        dplyr::filter(!label %in% c("Hormonal birth control duration under age 20","Started after 20","Unknown status",
                                    "Total years of smoking before 20","Smoking before 20 (Pack-years)","Never smoked")))
  data=data|>  modify_table_body(~ .x  |>    dplyr::mutate(sort = 1:nrow(.x)) |>
        dplyr::mutate(sort = if_else(and(variable=="sm_age_start_smok_cat",label == "20 years of age or older"),  sort + 4,
                                     if_else(label =="Unknown smoking status", sort + 3, sort)))|>arrange(sort))
     
  
  data = data |>
    modify_table_styling(
      column = "label",
      rows = data$table_body$label %in% c(
        "Participant characteristics at baseline",
        "Growth and reproductive factors",
        "Lifestyle factors",
        "Socioeconomic factors"
      ),
      text_format = "bold"
    )
  }
  data = modify_footnote(data, abbreviation = TRUE) |>
    as_gt() |> tab_footnote(
      footnote = "Multivariable models were adjusted for self-identified race/ethnicity, baseline BMI, smoking status 
                         (except for the analysis for the age started smoking), personal history of benign thyroid disease, personal educational level, 
                         household annual income, and Area Deprivation Index"
    )
  
}

#10 E-value
evalues.HR <- function(est, lo = NA, hi = NA, rare = NA, true = 1, ...) {
  
  # Sanity checks
  if (est < 0) stop("HR cannot be negative")
  
  if (is.na(rare)) rare <- NULL # for compatibility w/ HR constructor
  
  if (!inherits(est, "HR")) est <- HR(est, rare = rare)
  if (!is.na(lo) && !inherits(lo, "HR")) lo <- HR(lo, rare = attr(est, "rare"))
  if (!is.na(hi) && !inherits(hi, "HR")) hi <- HR(hi, rare = attr(est, "rare"))
  if (!inherits(true, "HR")) true <- HR(true, rare = attr(est, "rare"))
  
  est <- toRR(est)
  if (!is.na(lo)) lo <- toRR(lo)
  if (!is.na(hi)) hi <- toRR(hi)
  true <- toRR(true)
  
  return(evalues.RR(est = est, lo = lo, hi = hi))
}

add_evalues <- function(data) {
  evalues_output <- apply(data, 1, function(row) {
    if (!is.na(row["conf.high"]) && row["conf.high"] > 0) {  
      evalues_result <- as.data.frame(evalues.HR(est = row["estimate"], lo = row["conf.low"], hi = row["conf.high"], rare = TRUE))
      evalues_result <- evalues_result[-1, ]
      c(point = evalues_result$point, lower = evalues_result$lower, upper = evalues_result$upper)
    } else {
      c(point = NA, lower = NA, upper = NA)
    }
  })
  
  evalues_output <- as.data.frame(t(evalues_output))
  evalues_output$Evalues_confidence = ifelse(is.na(evalues_output$lower),evalues_output$upper,evalues_output$lower)
  # Add new columns to the data frame
  data <- cbind(data, evalues_output$point,evalues_output$Evalues_confidence)
  colnames(data)[(ncol(data) - 1):(ncol(data))] <- c("Evalues_estimate", "Evalues_confidence")
  
  return(data)
}

#11 Prepare for forest plot (strat long) for childhood paper
change_numbers_next_value=function(numbers) {
  for (i in 1:(length(numbers))) {
    if (i == length(numbers)) {numbers[i] = NA}
    else {numbers[i] <- numbers[i + 1]}
  }
  return(numbers)
}

change_all_values_next_value <- function(df, columns) {
  for (column in columns) {
    df[[column]] <- change_numbers_next_value(df[[column]])
  }
  return(df)
}

columns_to_change <- c("n_obs", "n_event", "exposure", "estimate", "std.error", 
                       "statistic", "nevent", "conf.low", "conf.high", "ci", "p.value","cases","n_event_ref")

forest_plot_child = function(dat,cat,label1,label2){
  dat = dat$table_body|>group_by(N)|>
    mutate(n_event_ref = ifelse(or(is.na(n_event),row_number()<=2),NA, n_event[2]))|>
    ungroup()|> 
    mutate(cases=ifelse(is.na(n_event),"",paste0(n_event,"/",n_event_ref)))|>filter(is.na(n_event) |label == cat)|>
    change_all_values_next_value(columns_to_change)|>
    dplyr::filter(or(label != cat,!is.na(n_event)))|>sort_childhood_not_gtsummary()|>
    mutate(ln_estimate=ifelse(n_event==0,NA,log(estimate)))|>
    mutate(ln_original_standard_error=ifelse(n_event==0,NA,(log(conf.high)-log(conf.low))/3.92))
  
  forest_meta_random=metagen(TE = ln_estimate,seTE = ln_original_standard_error,studlab=paste(label),
                             data=dat,comb.fixed = FALSE,
                             method.tau="DL",hakn=FALSE,prediction = FALSE,sm="HR",
                             random = FALSE, 
                             fixed = FALSE)
  plot=forest(forest_meta_random,print.tau2 = FALSE,col.diamond = "blue",
         label.right = "Risk higher",label.left = "Risk lower",
         colgap.left = "3mm",prediction = FALSE,
         leftcols=c("label","cases"),leftlabs = c("Factors",paste0(label1,"\n",label2," (cases)")),
         header.line=TRUE,
         rightcols = c("estimate","ci" ),
         rightlabs = c("HR","95%CI"),colgap.right = "5mm",colgap.forest.right = "5mm",
         resid.hetstat = FALSE,col.by = "black",subgroup = FALSE,
         addrow.overall=TRUE,hetstat = TRUE,overall.hetstat = FALSE,
         overall = FALSE,xlim = c(0.3,3.5), weight.study="same", plotwidth="2inch",
         spacing = 1.3,
         addrow = TRUE,
         fontsize = 14,squaresize =0.7)
  return(plot)
}

#12. Remove the numbering
remove_numbering_in_levels <- function(dat) {
  for (i in colnames(dat)) {
    if (is.factor(dat[, i])) {
      levels(dat[, i]) <- gsub("^\\d+\\.?\\s*\\)\\s*", "", levels(dat[, i]), perl = TRUE)
    }
  }
  return(dat)
}

#13. p-interaction

p_interaction = function(surv, var_name1, var_name2, covar, data, model_name=NULL)
{
  results_cox1 = reformulate(c(var_name1, var_name2, covar), response = surv)|>
      coxph(method = "breslow", data = data) 
   
  results_cox2 = reformulate(c(var_name1, var_name2,paste0(var_name1,"*",var_name2), covar), response = surv)|>
    coxph(method = "breslow", data = data) 
  
  p_interaction = anova(results_cox1,results_cox2)
  return(p_interaction)
}
