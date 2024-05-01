###Necessary R library and data loading for the Early-life project
library(here)
library(tidyverse)
library(gtsummary)
library(survival)
library(cmprsk)
library(broom)
library(broom.helpers)
library(tidymodels)
library(purrr)
library(splines)
library(Gmisc, quietly = TRUE)
library(glue)
library(htmlTable)
library(grid)
library(magrittr)
library(gt)
library(EValue)
library(meta)
library(metafor)
library(ggplot2)
library(gridExtra)

directory="C:/Users/trant4/OneDrive - National Institutes of Health/Trinh/Postdoc NCI - Risk factors and thyroid cancer/SS"

# label: data
earlylife_popu =
  read.csv(paste(directory,"/data/ss_earlylife_popu.csv",sep = ""),
           #because quarto cannot knit the output document if here::here("data/ss_earlylife_popu.csv") is put inside read.csv like this,
           header = TRUE,
           stringsAsFactors = TRUE,
           fileEncoding = "latin1"
  )

earlylife_popu = earlylife_popu |>remove_numbering_in_levels()|>
  mutate(
    ident_DTC_PTC = ifelse(ident_DTC_histo == "PTC", 1, 0),
    ident_DTC_stageI = ifelse(ident_DTC_stage_AJCC7 == "I", 1, ident_DTC),
    ident_DTC_adv_stage = ifelse(ident_DTC_stage_AJCC7%in%c("II","III"),1,0),
    ident_DTC_1cm = ifelse(ident_DTC_size == "<1 cm", 1, ident_DTC),
    ident_DTC_large_tumor = ifelse(ident_DTC_size%in%c("1-2 cm","2-4 cm","4 cm or more"),1,0)
  )

levels(earlylife_popu$ui_birth_weight_cat)=c("Between 2500 and 3999 g","< 2500 g","4000+ g","Unknown")
levels(earlylife_popu$ses_hh_compo_child)[levels(earlylife_popu$ses_hh_compo_child)=="Other"] = "Unknown"
levels(earlylife_popu$ses_edu_level)[3]="Bachelor's degree or higher"
levels(earlylife_popu$ses_edu_level_child)[3]="Bachelor's degree or higher"
levels(earlylife_popu$rep_br_dev_age_cat)=c("11-13 years of age","Less than 11 years of age", "14 years of age or more","Unknown")
levels(earlylife_popu$rep_age_menarche_cat)=c("12-14 years of age","Less than 12 years of age","14 years of age or more","Unknown")
levels(earlylife_popu$an_weight_age10)=c("Same weight","Lighter","Heavier","Unknown")
levels(earlylife_popu$an_height_age10)=c("Same height","Shorter","Taller","Unknown")
levels(earlylife_popu$an_weight_teen)=c("Same weight","Lighter","Heavier","Unknown")
levels(earlylife_popu$ses_income_child)=c("Middle income","Well off","Low income","Poor","Unknown")

smok=c("sm_age_start_smok_cat","sm_pack_yr_before20_cat","sm_yr_smok_before20_cat","sm_age_start_smok_cont")

