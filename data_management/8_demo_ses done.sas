data ss_demo_ses;
	set original;
	keep psid

	SE18	 	 	 	/*SE18. What is the highest education you completed*/

	/*SE19	 	 	 	/*SE19. Last year, your total income from all household members before taxes*/
	SE25	 	 	 	/*SE25. Your family's income level during the majority of your time growing up*/
	SE26	 	 	 	/*SE26. Were there times when your family didn't have enough to eat?*/
	SE19Impute	 	 	 	/*SE19. Last year, your total income from all household members before taxes [Imputed]*/
	SE_HHcomp1	 	 	 	/*CALC: Household composition at age 13(two parent, single parent, other)[SE23]*/

	/*SE_HHcomp2	 	 	 	/*CALC: Household composition at age 13(biol/adopt parent, step parent, etc)[SE23]*/
	/*SE23_Num	 	 	 	/*CALC: SE23. Number of legally responsible adults in HH when age 13*/
	SE_RACE_ETH	 	 	 	/*CALC: SE_RACE_ETH. Race (Non-Hisp White, Non-Hisp Blk, Hisp, Oth), w/precedence to Hisp, then Blk [SE4,SE6a-e]*/

	SE_Race_1	 	 	 	/*CALC: Race 1 (up to 5)*/
	/*SE_Race_2	 	 	 	/*CALC: Race 2 (up to 5)*/
	/*SE_Race_3	 	 	 	/*CALC: Race 3 (up to 5)*/
	/*SE_Race_4	 	 	 	/*CALC: Race 4 (up to 5)*/
	/*SE_Race_5	 	 	 	/*CALC: Race 5 (up to 5)*/
	SE_HHeducMax	 	 	 	/*CALC: Highest level of education in the houSehold at age 13 [SE24]*/

	/*SE_HHeducMin	 	 	 	/*CALC: Lowest level of education in the household at age 13 [SE24]*/
	/*SE_HHincome	 	 	 	/*CALC: Household income per person [SE19 midpoints/SE20]*/
	/*SE_Hispanic	 	 	 	/*CALC: Hispanic ethnicity*/
	SE_Marital_T0	 	 	 	/*CALC: Current marital status [SE12,SE13,SE14]*/

	/*OCS_CurrNonJobSituation	 	 	 	/*Current non-job situation (1=homemaker,2=student,...) [OC2]*/
	/*OCS_CurrNonJobSituationSp	 	 	 	/*Specify current non-job situation (1=homemaker,2=student,...) [OC2SP]*/
	/*OCS_CurrStatus	 	 	 	/*CALC:Currently working?*/
	/*OCS_CurrStatus20Hr	 	 	 	/*CALC:Currently working at least 20hrs/wk?*/
	/*OCS_JobEver	 	 	 	/*CALC:Reported working at one or more jobs lifetime*/

RS_P_UrbRur_Area
/*RS_L_UrbRur_Area*/
RS_C_UrbRur_Area
/*P_ADI2000_NatRank
/*L_ADI2000_NatRank*/
ADI2000_NatRank_T0
/*C_T80POPURB			/*% of the population whose residence is in an urban area (Tract Level:1980)*/
/*C_T80POPRUR			/*% of the population whose residence is in a rural area (Tract Level:1980)*/
/*C_T80MEDHSINC			/*Median household income of households within the geographic area specified (Tract Level:1980)*/
/*C_T80MEANHSINC			/*Mean household income of households within the geographic area specified (Tract Level:1980)*/
/*C_T80MEDFAMINC			/*Median family income of families within the geographic area specified (Tract Level:1980)*/
/*C_T80MEANFAMINC			/*Mean family income of families within the geographic area specified (Tract Level:1980)*/
/*C_T80BELOWPOV_INDIV			/*% of the population aged 5+ years within the geographic area specified who are below the poverty line (Tract Level:1980)*/
/*C_T80BELOWPOV_FAM			/*% of families within the geographic area specified who are below the poverty line (Tract Level:1980)*/
/*C_CENSUS_1980			/*Indicates whether census variables were provided that year, given yearstart/yearstop and whether address was fatal (1980)*/
/*C_T70POPNONFARM			/*% of the population whose residence is in a farming area (Tract Level:1970)*/
/*C_T70POPFARM			/*% of the population whose residence is in a non-farming area (Tract Level:1970)*/
/*C_T70MEANUNRINC			/*Mean unrelated individuals income ($) (Tract level: 1970)*/
/*C_T70MEANFAMINC			/*Mean family income of families within the geographic area specified (Tract Level:1970)*/
/*C_T70INC_LESS3000			/*% of families with income <$3,000 per year (Tract level: 1970)*/
/*C_T70INC_MORE50000			/*% of families with income >$5,000 per year (Tract level: 1970)*/
/*C_T70BELOW75POV_INDIV			/*% of individuals income below 75% the proverty line (Tract level: 1970)*/
/*C_T70BELOW125POV_INDIV			/*% of individuals income below 25% the proverty line (Tract level: 1970)*/
/*C_CENSUS_1970			/*Indicates whether census variables were provided that year, given yearstart/yearstop and whether address was fatal (1970)*/
/*C_T60POPURB			/*% of the population whose residence is in an urban area (Tract Level:1960)*/
/*C_T60POPRUR			/*% of the population whose residence is in a rural area (Tract Level:1960)*/
/*C_T60MEANUNRINC			/*Mean unrelated individuals income ($) (Tract level: 1960)*/
/*C_T60MEANFAMINC			/*Median family income of families within the geographic area specified (Tract Level:1960)*/
/*C_T60INC_LESS2000			/*% of households with income <$20,000 year (Block group level: 1960)*/
/*C_T60INC_MORE25000			/*% of households with income >$25,000 year (Block group level: 1960)*/
/*C_CENSUS_1960			/*Indicates whether census variables were provided that year, given yearstart/yearstop and whether address was fatal (1960)*/
/*C_T50MEDHSINC			/*Median household income of households within the geographic area specified (Tract Level:1950)*/
/*C_T50MEANHSINC			/*Mean household income of households within the geographic area specified (Tract Level:1950)*/
/*C_T50INC_LESS1500			/*% of households with income <$15,000 year (Block group level: 1950)*/
/*C_T50INC_MORE10000			/*% of households with income >$10,000 year (Block group level: 1950)*/
/*C_CENSUS_1950			/*Indicates whether census variables were provided that year, given yearstart/yearstop and whether address was fatal (1950)*/
/*P_T00_POPURB			/*% of the population whose residence is in an urban area (Tract Level:2000)*/
/*P_T00_POPRUR			/*% of the population whose residence is in a rural area (Tract Level:2000)*/
/*P_T00_MEDHSINC			/*Median household income of households within the geographic area specified (Tract Level:2000)*/
/*P_T00_MEANHSINC			/*Mean household income of households within the geographic area specified (Tract Level:2000)*/
/*P_T00_MEDFAMINC			/*Median family income of families within the geographic area specified (Tract Level:2000)*/
/*P_T00_MEANFAMINC			/*Mean family income of families within the geographic area specified (Tract Level:2000)*/
/*P_T00_INC_LESS15000			/*% of households within the geographic area specified with income <$15,000/year (Tract Level:2000)*/
/*P_T00_INC_MORE150000			/*% of households within the geographic area specified with income >$150,000/year (Tract Level:2000)*/
/*P_T00_BELOWPOV_INDIV			/*% of the population aged 5+ years within the geographic area specified who are below the poverty line (Tract Level:2000)*/
/*P_T00_BELOWPOV_FAM			/*% of families within the geographic area specified who are below the poverty line (Tract Level:2000)*/
/*P_T00_BELOWPOV_HSHLD			/*% of households within the geographic area specified who are below the poverty line (Tract Level:2000)*/
/*tr_p_poverty_family_2000_T0			/*Baseline Residence: % of families who are below the poverty line (Tract: 2000)*/
/*tr_p_poverty_hshld_2000_T0			/*Baseline Residence: % of households who are below the poverty line (Tract: 2000)*/
/*tr_mean_inc_family_2000_T0			/*Baseline Residence: Mean Family Income (Tract: 2000)*/
/*tr_mean_inc_hshld_2000_T0			/*Baseline Residence: Mean Household Income (Tract: 2000)*/
/*tr_med_inc_family_2000_T0			/*Baseline Residence: Median Family Income (Tract: 2000)*/
/*tr_med_inc_hshld_2000_T0			/*Baseline Residence: Median Household Income (Tract: 2000)*/
/*tr_p_pop_rural_2000_T0			/*Baseline Residence: % of the population living in a rural area (Tract: 2000)*/
/*tr_p_pop_urban_2000_T0			/*Baseline Residence: % of the population living in an urban area (Tract: 2000)*/
/*/*lc_state_match			/*LC_state_match FLAG: Longest lived and childhood states match (0=no, 1=yes)*/
/*/*lc_fipsmatch_c			/*LC_FIPSmatch FLAG: Longest lived and childhood FIPS codes match - 2000 county level (0=no, 1=yes)*/
/*/*lc_fipsmatch_t			/*LC_FIPSmatch FLAG: Longest lived and childhood FIPS codes match - 2000 census tract level (0=no, 1=yes)*/
/*lc_fipsmatch_g			/*LC_FIPSmatch FLAG: Longest lived and childhood FIPS codes match - 2000 census block group level (0=no, 1=yes)*/
/*lc_fipsmatch_k			/*LC_FIPSmatch FLAG: Longest lived and childhood FIPS codes match - 2000 census block level (0=no, 1=yes)*/
/*lc_geomatch			/*LC_Geomatch FLAG: Longest lived and childhood geocodes match to 0.001 degree of longitude and latitude (0=no, 1=yes)*/
/*pc_state_match			/*PC_state_match FLAG: Primary and childhood states match (0=no, 1=yes)*/
/*pc_fipsmatch_c			/*PC_FIPSmatch FLAG: Primary and childhood FIPS codes match - 2000 county level (0=no, 1=yes)*/
/*pc_fipsmatch_t			/*PC_FIPSmatch FLAG: Primary and childhood FIPS codes match - 2000 census tract level (0=no, 1=yes)*/
/*pc_fipsmatch_g			/*PC_FIPSmatch FLAG: Primary and childhood FIPS codes match - 2000 census block group level (0=no, 1=yes)*/
/*pc_fipsmatch_k			/*PC_FIPSmatch FLAG: Primary and childhood FIPS codes match - 2000 census block level (0=no, 1=yes)*/
/*pc_geomatch			/*PC_Geomatch FLAG: Primary and childhood geocodes match to 0.001 degree of longitude and latitude (0=no, 1=yes)*/
/*pl_state_match			/*PL_state_match FLAG: Primary and longest lived states match (0=no, 1=yes)*/
/*pl_fipsmatch_c			/*PL_FIPSmatch FLAG: Primary and longest lived FIPS codes match - 2000 county level (0=no, 1=yes)*/
/*pl_fipsmatch_t			/*PL_FIPSmatch FLAG: Primary and longest lived FIPS codes match - 2000 census tract level (0=no, 1=yes)*/
/*pl_fipsmatch_g			/*PL_FIPSmatch FLAG: Primary and longest lived FIPS codes match - 2000 census block group level (0=no, 1=yes)*/
/*pl_fipsmatch_k			/*PL_FIPSmatch FLAG: Primary and longest lived FIPS codes match - 2000 census block level (0=no, 1=yes)*/
/*pl_geomatch			/*PL_Geomatch FLAG: Primary and longest lived geocodes match to 0.001 degree of longitude and latitude (0=no, 1=yes)*/
/*ps_state_match			/*PS_state_match FLAG: Primary and secondary states match (0=no, 1=yes)*/
/*ps_fipsmatch_c			/*PS_FIPSmatch FLAG: Primary and secondary FIPS codes match - 2000 county level (0=no, 1=yes)*/
/*ps_fipsmatch_t			/*PS_FIPSmatch FLAG: Primary and secondary FIPS codes match - 2000 census tract level (0=no, 1=yes)*/
/*ps_fipsmatch_g			/*PS_FIPSmatch FLAG: Primary and secondary FIPS codes match - 2000 census block group level (0=no, 1=yes)*/
/*ps_fipsmatch_k			/*PS_FIPSmatch FLAG: Primary and secondary FIPS codes match - 2000 census block level (0=no, 1=yes)*/
/*P_USDA_ERS_RurUrbCC_2003			/*Primary/Current Residence: USDA ERS Rural-Urban Continuum Code (year 2003)*/
/*USDA_ERS_RurUrbCC_2003_T0			/*Baseline Residence: USDA ERS Rural-Urban Continuum Code (year 2003)*/

;
run;
proc rank data=ss_demo_ses
     groups=4
     out=quint(keep=psid ses_ADI_baseline_cat );
var ADI2000_NatRank_T0 ;
ranks ses_ADI_baseline_cat;
run;
data ss_demo_ses;
merge ss_demo_ses quint;
by psid;
run;

data ss_demo_ses;
	set ss_demo_ses;

	if SE18 in (1 2 3 4 5) then ses_edu_level = 0; /*Highschool or GED or less*/
	else if SE18 in (6 7) then ses_edu_level = 1; /*Some college or associate or technical degree*/
	else if SE18 >= 8 then ses_edu_level = 2; /*Bachelor’s degree or higher*/
	else ses_edu_level = 3; /*Unknown*/

	if 5>SE19impute >=1 then
		ses_income = SE19impute;
	else if SE19impute=5 then
		ses_income = 4;
	else ses_income=-1;

	if SE25 >=0 then
		ses_income_child = SE25;
	else ses_income_child = 5;

	if SE26 >=0 then
		ses_hunger_child = SE26;
	else ses_hunger_child = -1;

	if SE_HHcomp1 >=0 then
		ses_hh_compo_child = SE_HHcomp1;
	else ses_hh_compo_child = 4;

	if SE_HHeducMax in (1 2 3 4 5) then ses_edu_level_child = 0; /*Highschool or GED or less*/
	else if SE_HHeducMax in (6 7) then ses_edu_level_child = 1; /*Some college or associate or technical degree*/
	else if SE_HHeducMax >= 8 then ses_edu_level_child = 2; /*Bachelor’s degree or higher*/
	else ses_edu_level_child = 3; /*Unknown*/

	if SE_Marital_T0 = 1 then
		ses_marital_status = 2;
	else if SE_Marital_T0 in (2 3 4) then
		ses_marital_status = 3;
	else if SE_Marital_T0 = 5 then
		ses_marital_status = 1;
	else ses_marital_status = -1;

	if SE_RACE_ETH=0 then ses_race  = 0; /*Non-Hispanic White*/
	else if SE_RACE_ETH=1 then ses_race  = 1; /*Non-Hispanic Black*/
	else if SE_RACE_ETH=2 then ses_race  = 2; /* Hispanic*/
	else if SE_RACE_ETH=3 then ses_race=3; /*Non-Hispanic all other races*/
	else ses_race=4;/*Unknown*/


	if SE_RACE_ETH=0 then ses_race_detail  = 0; /*Non-Hispanic White*/
	else if SE_RACE_ETH=1 then ses_race_detail  = 1; /*Non-Hispanic Black*/
	else if SE_RACE_ETH=2 then ses_race_detail  = 2; /* Hispanic*/
	else if SE_RACE_ETH=3 then do; /*Non-Hispanic all other races*/
	if SE_Race_1=3 then ses_race_detail=3;/*Other: Asian*/
	else if SE_Race_1=4 then ses_race_detail=4;/*Other: American Indian/Alaska Native*/
	else if SE_Race_1=5 then ses_race_detail=5;/*Other: Hawaiian/Pacific Islander */
	end;
	else ses_race_detail=6 /*Unknown*/;

	if ses_ADI_baseline_cat<0 then ses_ADI_baseline_cat = -1; else ses_ADI_baseline_cat = ses_ADI_baseline_cat;

	if RS_P_UrbRur_Area<0 or RS_P_UrbRur_Area = 5 then ses_urban_baseline=-1;
	else ses_urban_baseline=RS_P_UrbRur_Area;

	if RS_C_UrbRur_Area<0 or RS_C_UrbRur_Area = 5 then ses_urban_child=-1;
	else ses_urban_child=RS_C_UrbRur_Area;


	format ses_edu_level edu. ses_income income. ses_income_child income_childhood. 
			ses_race race. ses_race_detail race_other.	ses_hunger_child yesno. 
			ses_hh_compo_child household_compo. ses_edu_level_child edu. 
			ses_marital_status marital. ses_ADI_baseline_cat adi. 
			ses_urban_baseline ses_urban_child residence.

	;
	drop   SE18   se19impute SE25 SE26 SE_HHcomp1 SE_HHeducMax SE_Marital_T0 
			SE_RACE_ETH SE_Race_1 RS_P_UrbRur_Area RS_C_UrbRur_Area ADI2000_NatRank_T0

	;
run;

data ss_demo_ses;
	set ss_demo_ses;
	array change _numeric_;

	do over change;
		if change in (. .A, .B, .C, .D, .E, .F, .G, .H, .I, .J, .K, .L, .M, .N, .O, .P, .Q, .R, .S, .T, .U, .V, .W, .X, .Y, .Z ) then
			change=-1;
	end;
run;

/*data ss_demo_ses;
set ss_demo_ses;
array change 
;
       do over change;
           if change =-1 then change=.;
       end;
run;

/*
PROC CONTENTS DATA=ss_demo_ses OUT=var_info NOPRINT;
RUN;
DATA variables_with_formats;
   SET var_info;
   WHERE format = '';
   KEEP name label;
RUN;
proc freq data=ss.ss_demo_ses;table _numeric_;run;*/
data ss.ss_demo_ses;
	set ss_demo_ses;
run;

proc datasets library=work nolist;
	delete ss_demo_ses quint;
quit;
