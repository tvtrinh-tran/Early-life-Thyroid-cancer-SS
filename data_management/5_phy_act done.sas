data ss_phy_act;
	set original;
	keep psid

		/*PH10	 	 	 	/*PH10. Relative amount of physical activity*/

	/*PH16	 	 	 	/*PH16. At age 10, # hrs/wk active*/
	/*PH18	 	 	 	/*PH18. At age 10, # hrs/wk strenuous chores*/
	/*PH19	 	 	 	/*PH19. At age 10, described as a tomboy*/
	/*PH20	 	 	 	/*PH20. At age 16, # hrs/wk active*/
	/*PH22	 	 	 	/*PH22. At age 16, # hrs/wk strenuous chores*/
	/*PH12_NumActivity	 	 	 	/*CALC: PH12. # childhood activities with complete data*/
	/*PH12_NumActivityMissing	 	 	 	/*CALC: PH12. # childhood activities with incomplete data*/
	PH12_TotHrsPerWeekChild	 	 	 	/*CALC: PH12. Total hours per week per year, ages 5-12, (summed over all childhood activities/8)*/
	PH12_TotHrsPerWeekTeens	 	 	 	/*CALC: PH12. Total hours per week per year, ages 13-19, (summed over all childhood activities/7)*/
	PH12_TotHrsPerWeekTotal	 	 	 	/*CALC: PH12. Total hours per week per year, ages 5-19, (summed over all childhood activities/15)*/
	PH12_TotMET_HrsPerWeekChild	 	 	 	/*CALC: PH12. Total MET hours per week per year, ages 5-12, (summed over all childhood activities/8)*/
	PH12_TotMET_HrsPerWeekTeens	 	 	 	/*CALC: PH12. Total MET hours per week per year, ages 13-19, (summed over all childhood activities/7)*/
	PH12_TotMET_HrsPerWeekTotal	 	 	 	/*CALC: PH12. Total MET hours per week per year, ages 5-19, (summed over all childhood activities/15)*/

	/*PH17_01	 	 	 	/*CALC: PH17. At age 10, walked to school [main: combine PH17_02, PH17_03]*/
	/*PH17_02	 	 	 	/*CALC: PH17. (main only) At age 10, walked 1/2 mile or less to school*/
	/*PH17_03	 	 	 	/*CALC: PH17. (main only) At age 10, walked more than 1/2 mile to school*/
	/*PH17_04	 	 	 	/*CALC: PH17. At age 10, rode bicycle to school*/
	/*PH17_05	 	 	 	/*CALC: PH17. At age 10, took bus/car/train to school*/
	/*PH17_06	 	 	 	/*CALC: PH17. At age 10, did not go to school*/
	/*PH17_07	 	 	 	/*CALC: PH17. At age 10, NA - lived at school*/
	/*PH21_01	 	 	 	/*CALC: PH21. At age 16, walked to school [main: combine PH21_02, PH21_03]*/
	/*PH21_02	 	 	 	/*CALC: PH21. (main only) At age 16, walked 1/2 mile or less to school*/
	/*PH21_03	 	 	 	/*CALC: PH21. (main only) At age 16, walked more than 1/2 mile to school*/
	/*PH21_04	 	 	 	/*CALC: PH21. At age 16, rode bicycle to school*/
	/*PH21_05	 	 	 	/*CALC: PH21. At age 16, took bus/car/train to school*/
	/*PH21_06	 	 	 	/*CALC: PH21. At age 16, did not go to school*/
	/*PH21_07	 	 	 	/*CALC: PH21. At age 16, NA - lived at school*/
	/*PH21a	 	 	 	/*PH21a. (main only) At age 16, Worked during school*/
	/*PH21b_01	 	 	 	/*CALC: PH21b. (main only) At age 16, walked 1/2 mile or less to work*/
	/*PH21b_02	 	 	 	/*CALC: PH21b. (main only) At age 16, walked more than 1/2 mile to work*/
	/*PH21b_03	 	 	 	/*CALC: PH21b. (main only) At age 16, rode bicycle to work*/
	/*PH21b_04	 	 	 	/*CALC: PH21b. (main only) At age 16, took bus/car/train to work*/
	/*PH2_NumActivity	 	 	 	/*CALC: PH2 number of current activities with complete data*/
	/*PH2_NumActivityMissing	 	 	 	/*CALC: PH2 number of current activities with incomplete data*/
	/*PH2_TotHrsPerWeek	 	 	 	/*CALC: PH2 Total hours per week (summed over all current sports/exercise activities)*/
	/*PH2_TotMETHrsPerWeek	 	 	 	/*CALC: PH2 Total MET-hours per week (summed over all current sports/exercise activities)*/
	/*PH6_TotHrsPerWeek	 	 	 	/*CALC: PH6 (walking) total hours per week*/
	/*PH6_TotMETHrsPerWeek	 	 	 	/*CALC: PH6 (walking) total MET-hours per week*/
	/*PH7_TotHrsPerWeek	 	 	 	/*CALC: PH7 (climbed stairs) total hours per week*/
	/*PH7_TotMETHrsPerWeek	 	 	 	/*CALC: PH7 (climbed stairs) total MET-hours per week*/
	/*PH8_TotHrsPerWeek	 	 	 	/*CALC: PH8 (moderately strenuous chores) total hours per week*/
	/*PH8_TotMETHrsPerWeek	 	 	 	/*CALC: PH8 (moderately strenuous chores) total MET-hours per week*/
	/*PH9_TotHrsPerWeek	 	 	 	/*CALC: PH9 (strenuous chores) total hours per week*/
	/*PH9_TotMETHrsPerWeek	 	 	 	/*CALC: PH9 (strenuous chores) total MET-hours per week*/
	/*PH_Activity_Age10	 	 	 	/*CALC: PH12. Childhood activity, yes/no at age 10 (across all activities 1-10)*/
	/*PH_Activity_Age16	 	 	 	/*CALC: PH12. Childhood activity, yes/no at age 16 (across all activities 1-10)*/
	PH_CurrentTotHrsPerWeek	 	 	 	/*CALC: All current activities, total hours per week (summed over sports/exercise[PH2] and daily activities[PH6,PH7,PH8,PH9])*/
	PH_CurrentTotMETHrsPerWeek	 	 	 	/*CALC: All current activities, total MET-hours per week (summed over sports/exercise[PH2] and daily activities[PH6,PH7,PH8,PH9])*/
	PH_CurrentTotMETHrsPerWeek_CDC	/*CALC: Fulfilled CDC recommended 7.5 MET-hours/week - all current sports/exercise and daily activities*/
	/*PH_HrsPerWk_Age10	 	 	 	/*CALC: PH12. Childhood activity, hours per week at age 10 [sum activities 1-10 at age 10, (PH15*4.33*PH14)/52]*/
	/*PH_HrsPerWk_Age16	 	 	 	/*CALC: PH12. Childhood activity, hours per week at age 16 [sum activities 1-10 at age 16, (PH15*4.33*PH14)/52]*/
	/*PH_METhrsPerWk_Age10	 	 	 	/*CALC: PH12. Childhood activity, MET hours per week at age 10 [sum activities 1-10 at age 10, PH12Mets*((PH15*4.33*PH14)/52)]*/
	/*PH_METhrsPerWk_Age16	 	 	 	/*CALC: PH12. Childhood activity, MET hours per week at age 16 [sum activities 1-10 at age 16, PH12Mets*((PH15*4.33*PH14)/52)]*/
	;
run;

data ss_phy_act;
	set ss_phy_act;
	format
	PH12_TotHrsPerWeekChild	 	 hrs_week.
	PH12_TotHrsPerWeekTeens	 	 hrs_week.
	PH12_TotHrsPerWeekTotal	 	 hrs_week.
	PH_CurrentTotHrsPerWeek	 	 hrs_week.
	PH12_TotMET_HrsPerWeekChild	 met_week.
	PH12_TotMET_HrsPerWeekTeens	 met_week.
	PH12_TotMET_HrsPerWeekTotal	 met_week.
	PH_CurrentTotMETHrsPerWeek   met_week.
	PH_CurrentTotMETHrsPerWeek_CDC noyes.;
run;

data ss_phy_act;
	set ss_phy_act;
	ph_hrs_wk_child_cont=1*PH12_TotHrsPerWeekChild	; 	 	 	/*CALC: PH12. Total hours per week per year, ages 5-12, (summed over all childhood activities/8)*/
	ph_hrs_wk_teen_cont=1*PH12_TotHrsPerWeekTeens	 ;	 	 	/*CALC: PH12. Total hours per week per year, ages 13-19, (summed over all childhood activities/7)*/
	ph_hrs_wk_before20_cont=1*PH12_TotHrsPerWeekTotal;	 	 	 	/*CALC: PH12. Total hours per week per year, ages 5-19, (summed over all childhood activities/15)*/
	ph_hrs_wk_current_cont=1*PH_CurrentTotHrsPerWeek;
	ph_MET_wk_child_cont=1*PH12_TotMET_HrsPerWeekChild	; 	 	 	/*CALC: PH12. Total MET hours per week per year, ages 5-12, (summed over all childhood activities/8)*/
	ph_MET_wk_teen_cont=1*PH12_TotMET_HrsPerWeekTeens	 ;	 	 	/*CALC: PH12. Total MET hours per week per year, ages 13-19, (summed over all childhood activities/7)*/
	ph_MET_wk_before20_cont=1*PH12_TotMET_HrsPerWeekTotal;	 	 	 	/*CALC: PH12. Total MET hours per week per year, ages 5-19, (summed over all childhood activities/15)*/
	ph_MET_wk_current_cont=1*PH_CurrentTotMETHrsPerWeek;
	;
run;

data ss_phy_act;
	set ss_phy_act;
	rename
		PH12_TotHrsPerWeekChild	 	= ph_hrs_wk_child_cat
		PH12_TotHrsPerWeekTeens	 	= ph_hrs_wk_teen_cat
		PH12_TotHrsPerWeekTotal	 	= ph_hrs_wk_before20_cat
		PH_CurrentTotHrsPerWeek	 	= ph_hrs_wk_current_cat
		PH12_TotMET_HrsPerWeekChild = ph_MET_wk_child_cat
		PH12_TotMET_HrsPerWeekTeens = ph_MET_wk_teen_cat
		PH12_TotMET_HrsPerWeekTotal = ph_MET_wk_before20_cat
		PH_CurrentTotMETHrsPerWeek  = ph_MET_wk_current_cat
	;
run;

data ss_phy_act;
	set ss_phy_act;
	array change _numeric_;

	do over change;
		if change in (. .A, .B, .C, .D, .E, .F, .G, .H, .I, .J, .K, .L, .M, .N, .O, .P, .Q, .R, .S, .T, .U, .V, .W, .X, .Y, .Z ) then
			change=-1;
	end;
run;

data ss_phy_act;
	set ss_phy_act;
	array change 
		ph_MET_wk_before20_cont
		ph_MET_wk_child_cont
		ph_MET_wk_current_cont
		ph_MET_wk_teen_cont
		ph_hrs_wk_before20_cont
		ph_hrs_wk_child_cont
		ph_hrs_wk_current_cont
		ph_hrs_wk_teen_cont
	;

	do over change;
		if change =-1 then
			change=.;
	end;
run;

/*
PROC CONTENTS DATA=ss_phy_act OUT=var_info NOPRINT;
RUN;
DATA variables_with_formats;
  SET var_info;
  WHERE format = '';
  KEEP name label;
RUN;
proc freq data=ss_phy_act;table _numeric_;run;*/
data ss.ss_phy_act;
	set ss_phy_act;
run;

proc datasets library=work nolist;
	delete ss_phy_act;
quit;

/*
Proc contents data=ss_phy_act;
run;

proc format fmtlib lib=ss.D_ss_formats;
select 
PHMISS1X;
run;

*/
