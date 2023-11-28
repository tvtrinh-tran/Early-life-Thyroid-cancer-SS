
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
      digits = all_continuous() ~ 1,
      missing = "ifany"
    )  |>
    remove_row_type(variables = ses_race,
                    type = "level",
                    level_value = "Unknown")  |>
    remove_row_type(
      variables = ses_race_detail,
      type = "level",
      level_value = c("1) Non-Hispanic White",
                      "2) Non-Hispanic Black",
                      "3) Hispanic")
    )  |>
    remove_row_type(variables = ses_race_detail,
                    type = "header")
  return(Descriptive_table)
}

#2. Function for cox models
cox_model = function(surv,var_name, var_label, covar, data)
{
  results_cox_function = map2(
    .x = var_name,
    .y = var_label,
    ~ reformulate(c(.x, covar), response = surv) |>
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
    modify_table_styling(
      columns = c(estimate, ci),
      rows = p.value < 0.05,
      text_format = "bold"
    ) |>
    modify_header(n_event ~ "**Number of events**",
                  exposure ~ "**Person-years**",
                  estimate ~ "**HR**") |>
    modify_table_body( ~ .x |> dplyr::relocate(exposure, .before = estimate))
  return(results_cox_function)
  rm(results_cox_function)
}
#3 Polish tables for in utero paper
polish_utero = function(data) 
{
  #polish the table
  data = modify_footnote(data,
                         abbreviation = TRUE,
                         `estimate_2` ~ "Multivariate models were adjusted for race/ethnicity, baseline BMI, smoking, baseline thyroid benign disease, 
                         educational level, household income, and Area Deprivation Index"
  ) 
  
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

#4 Stratified analyses


stratification = function(strat_var,
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