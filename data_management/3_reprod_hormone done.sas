data ss_reprod_hormone;
	set original;
	keep psid
		AgeExact_Baseline
		AN_BreastDevAge	 	 	 	/*AN_BreastDevAge*/

HR_MenopauseAgeExact_T0			/*CALC: HR_MenopauseAgeExact_T0. Age at menopause status rounded to the 1/10th, at baseline adjusted for consistency with DFU data */
HR_MenopauseStatus_T0				/*HR_MenopauseStatus_T0*/
HR_Menopause_T0				/*HR_Menopause_T0*/
PG_AgeFirstTermPG_T0				/*PG_AgeFirstTermPG_T0*/
PG_AgeLastTermPG_T0				/*PG_AgeLastTermPG_T0*/
PG_BreastTotal_t0				/*PG_BreastTotal_t0*/
PG_EverPreg_t0				/*PG_EverPreg_t0*/
PG_LastTermPGIndex_T0				/*PG_LastTermPGIndex_T0*/
PG_MenarcheAge				/*PG_MenarcheAge*/
DR315_HR_BCAny_Adol			
DR315_HR_BCAny_Adol_Yrs		
DR315_HR_BCDepo_Adol		
DR315_HR_BCDepo_Adol_Yrs	
DR315_HR_BCIUDh_Adol		
DR315_HR_BCIUDh_Adol_Yrs	
DR315_HR_BCNorp_Adol		
DR315_HR_BCNorp_Adol_Yrs	
DR315_HR_BCPill_Adol		
DR315_HR_BCPill_Adol_Yrs	
DR315_HR_BCothr_Adol		
DR315_HR_BCothr_Adol_Yrs	
DR315_HR_BCpatc_Adol		
DR315_HR_BCpatc_Adol_Yrs	
HR_BCDepo_MinAge			
HR_BCIUDh_MinAge_T0			
HR_BCIUDpatc_MinAge		
HR_BCNorp_MinAge			
HR_BCothr_MinAge			
HR_BCpatc_MinAge				
HR_BCpillPatcRing_MinAge		
HR_BCpill_MinAge_T0				
HR_BCAny_Ever_T0				
HR_BCAny_MinAge_T0				
HR_HRT_Ever_T0				
;
run;



data ss_reprod_hormone;
	set ss_reprod_hormone;

	rep_br_dev_age_cont=1*AN_BreastDevAge;
	if rep_br_dev_age_cont>=21 then rep_br_dev_age_cont = .; /*if age at thelarche >=21 then it is considered implausible and missing data is assigned https://www.ncbi.nlm.nih.gov/pmc/articles/PMC8666031/*/

	rep_meno_age_cont=1*HR_MenopauseAgeExact_T0;
	rep_first_preg_cont=1*PG_AgeFirstTermPG_T0;
	rep_br_feed_dur=1*PG_BreastTotal_t0;

	rep_age_menarche_cont=1*PG_MenarcheAge;
	if rep_age_menarche_cont>=21 then rep_age_menarche_cont = .; /*if age at menarche >=21 then it is considered implausible and missing data is assigned to be consistent with age at thelarche*/


	if PG_EverPreg_t0 =0 then
		rep_first_preg_cat=0;
	else if PG_EverPreg_t0 =1 and 0<rep_first_preg_cont<25 then
		rep_first_preg_cat=1;
	else if PG_EverPreg_t0 =1 and 25<=rep_first_preg_cont<29 then
		rep_first_preg_cat=2;
	else if PG_EverPreg_t0 =1 and 29<=rep_first_preg_cont<35 then
		rep_first_preg_cat=3;
	else if PG_EverPreg_t0 =1 and 35=<rep_first_preg_cont then
		rep_first_preg_cat=4;
	else rep_first_preg_cat=-1;

	if HR_Menopause_T0	 =0 then
		rep_meno_age_cat = 0;
	else if HR_Menopause_T0=1 then
		do;
			if 0<HR_MenopauseAgeExact_T0<45 then
				rep_meno_age_cat=1;
			else if 45<=HR_MenopauseAgeExact_T0<55 then
				rep_meno_age_cat=2;
			else if HR_MenopauseAgeExact_T0>=55 then
				rep_meno_age_cat=3;
			else rep_meno_age_cat=4;
		end;
	else rep_meno_age_cat=-1;

	/*Time since last pregnancy*/
	if PG_AgeLastTermPG_T0 in (.D .M .N .Q .R .T) then
		rep_last_preg_cont=.;
	else rep_last_preg_cont=AgeExact_Baseline-PG_AgeLastTermPG_T0;

	if PG_EverPreg_t0 =0 then
		rep_last_preg_cat=0;
	else if PG_EverPreg_t0 =1 and 0<rep_last_preg_cont<10 then
		rep_last_preg_cat=1;
	else if PG_EverPreg_t0 =1 and 10<=rep_last_preg_cont<20 then
		rep_last_preg_cat=2;
	else if PG_EverPreg_t0 =1 and rep_last_preg_cont>=20 then
		rep_last_preg_cat=3;
	else rep_last_preg_cat=-1;

	if PG_EverPreg_t0=0 then
		rep_nb_preg_cont = 0;
	else rep_nb_preg_cont= 1*PG_LastTermPGIndex_T0;
	rep_nb_preg_cat=rep_nb_preg_cont;
	;
run;

/****classify according to active ingredient(s): 
most pills are combined estrogen and progesteron, only 2-4% are progestin only. Refs: 10.1016/j.contraception.2012.05.018 and 10.1016/j.contraception.2012.05.003.*/
data ss_reprod_hormone;
	set ss_reprod_hormone;

	/***Any hormonal birth control before 20***/
	/*Duration*/
	if DR315_HR_BCAny_Adol = 0 and 0>=HR_BCAny_MinAge_T0 then
		rep_bc_ado_dur_cat=0;
	else if DR315_HR_BCAny_Adol = 1 and  0<DR315_HR_BCAny_Adol_Yrs<5 then
		rep_bc_ado_dur_cat=1;
	else if DR315_HR_BCAny_Adol = 1 and  DR315_HR_BCAny_Adol_Yrs>=5 then
		rep_bc_ado_dur_cat=2;
	else if DR315_HR_BCAny_Adol = 1 and DR315_HR_BCAny_Adol_Yrs<=0 then
		rep_bc_ado_dur_cat=3;
	else if DR315_HR_BCAny_Adol = 0 and HR_BCAny_MinAge_T0>20 then
		rep_bc_ado_dur_cat=4;
	else rep_bc_ado_dur_cat=5;
	rep_bc_ado_dur_cont=1*DR315_HR_BCAny_Adol_Yrs;

	/*Min age*/
	if DR315_HR_BCAny_Adol = 0 and 0>=HR_BCAny_MinAge_T0 then
		rep_bc_min_age_cat=0;
	else if DR315_HR_BCAny_Adol = 1 and 0<HR_BCAny_MinAge_T0<=15 then
		rep_bc_min_age_cat=1;
	else if DR315_HR_BCAny_Adol = 1 and 15<=HR_BCAny_MinAge_T0<=20 then
		rep_bc_min_age_cat=2;
	else if DR315_HR_BCAny_Adol = 0 and HR_BCAny_MinAge_T0>20 then
		rep_bc_min_age_cat=3;
	else rep_bc_min_age_cat=4;

	if rep_bc_min_age_cat ne 4 then
		rep_bc_min_age_cont=1*HR_BCAny_MinAge_T0;

	/*Progestin-only birth control before 20*/
	/*Duration*/
	rep_proges_ado=max(of DR315_HR_BCDepo_Adol DR315_HR_BCIUDh_Adol DR315_HR_BCNorp_Adol);
	rep_proges_ado_dur_cont=1*max(of DR315_HR_BCDepo_Adol_Yrs DR315_HR_BCIUDh_Adol_Yrs DR315_HR_BCNorp_Adol_Yrs);

	if rep_proges_ado = 0 then
		rep_proges_ado_dur_cat=0;
	else if rep_proges_ado = 1 and  0<rep_proges_ado_dur_cont<5 then
		rep_proges_ado_dur_cat=1;
	else if rep_proges_ado = 1 and  rep_proges_ado_dur_cont>=5 then
		rep_proges_ado_dur_cat=2;
	else if rep_proges_ado = 1 and rep_proges_ado_dur_cont<=0 then
		rep_proges_ado_dur_cat=3;
	else rep_proges_ado_dur_cat = 4;

	/*Min age*/
	rep_proges_min_age_cont=min(of HR_BCDepo_MinAge HR_BCIUDh_MinAge_T0 HR_BCNorp_MinAge);

	if rep_proges_ado = 0 and 0>=rep_proges_min_age_cont then
		rep_proges_min_age_cat=0;
	else if rep_proges_ado = 1 and 0<rep_proges_min_age_cont<=15 then
		rep_proges_min_age_cat=1;
	else if rep_proges_ado = 1 and 15<=rep_proges_min_age_cont<=20 then
		rep_proges_min_age_cat=2;
	else if rep_proges_ado = 0 and rep_proges_min_age_cont>20 then
		rep_proges_min_age_cat=3;
	else rep_proges_min_age_cat=4;

	if rep_proges_min_age_cat = 4 then
		rep_proges_min_age_cont=.;

	/*combined hormonal birth control before 20*/
	/*Duration*/
	rep_combined_ado=max(of DR315_HR_BCPill_Adol DR315_HR_BCpatc_Adol);
	rep_combined_ado_dur_cont=max(of DR315_HR_BCPill_Adol_Yrs DR315_HR_BCpatc_Adol_Yrs);

	if rep_combined_ado = 0 then
		rep_combined_ado_dur_cat=0;
	else if rep_combined_ado = 1 and  0<rep_combined_ado_dur_cont<5 then
		rep_combined_ado_dur_cat=1;
	else if rep_combined_ado = 1 and  rep_combined_ado_dur_cont>=5 then
		rep_combined_ado_dur_cat=2;
	else if rep_combined_ado = 1 and rep_combined_ado_dur_cont<=0 then
		rep_combined_ado_dur_cat=3;
	else rep_combined_ado_dur_cat = 4;

	/*Min age*/
	rep_combined_min_age_cont=min(of HR_BCpill_MinAge_T0 HR_BCpatc_MinAge);

	if rep_combined_ado = 0 and 0>=rep_combined_min_age_cont then
		rep_combined_min_age_cat=0;
	else if rep_combined_ado = 1 and 0<rep_combined_min_age_cont<=15 then
		rep_combined_min_age_cat=1;
	else if rep_combined_ado = 1 and 15<=rep_combined_min_age_cont<=20 then
		rep_combined_min_age_cat=2;
	else if rep_combined_ado = 0 and rep_combined_min_age_cont>20 then
		rep_combined_min_age_cat=3;
	else rep_combined_min_age_cat=4;

	if rep_combined_min_age_cat = 4 then
		rep_combined_min_age_cont=.;

	/*Type of birth control*/
	if DR315_HR_BCAny_Adol = 0 then
		do;
			rep_bc_ado_type=0;
			rep_bc_ingredient=0;
		end;
	else if DR315_HR_BCPill_Adol=1 then
		do;
			rep_bc_ado_type=1;
			rep_bc_ingredient=1;
		end;/*assume all oral pills are combined pills, see 10.1016/j.contraception.2012.05.018 and 10.1016/j.contraception.2012.05.003.*/
	else if DR315_HR_BCNorp_Adol=1 then
		do;
			rep_bc_ado_type=2;
			rep_bc_ingredient=2;
		end;
	else if DR315_HR_BCIUDh_Adol=1 then
		do;
			rep_bc_ado_type=3;
			rep_bc_ingredient=2;
		end;
	else if DR315_HR_BCDepo_Adol=1 then
		do;
			rep_bc_ado_type=4;
			rep_bc_ingredient=2;
		end;
	else if DR315_HR_BCPatc_Adol=1 then
		do;
			rep_bc_ado_type=5;
			rep_bc_ingredient=1;
		end;
	else if DR315_HR_BCAny_Adol=1 then
		do;
			rep_bc_ado_type=6;
			rep_bc_ingredient=3;
		end;
	else if DR315_HR_BCAny_Adol ne 1 then
		do;
			rep_bc_ado_type=7;
			rep_bc_ingredient=4;
		end;
	;
run;

data ss_reprod_hormone;
	set ss_reprod_hormone;
	format
	AN_BreastDevAge	 	 thelarche.
	HR_Menopause_T0 yesno.
	HR_MenopauseStatus_T0 meno_cause.
	rep_meno_age_cat meno_age.
	rep_first_preg_cat first_preg.
	rep_last_preg_cat last_preg.
	PG_EverPreg_t0 yesno.
	rep_nb_preg_cat nb_preg.
	PG_MenarcheAge age_menarche.
	DR315_HR_BCAny_Adol rep_proges_ado rep_combined_ado HR_BCAny_Ever_T0 HR_HRT_Ever_T0 yesno.
	rep_bc_ado_dur_cat bc_ado_dur_all.
    rep_proges_ado_dur_cat rep_combined_ado_dur_cat bc_ado_dur.
	rep_bc_min_age_cat rep_proges_min_age_cat rep_combined_min_age_cat bc_min_age.
	rep_bc_ado_type bc_type.
	rep_bc_ingredient bc_ingredient.
	;
run;

data ss_reprod_hormone;
	set ss_reprod_hormone;
	rename
		AN_BreastDevAge	 	=rep_br_dev_age_cat
		HR_MenopauseStatus_T0	 	=rep_meno_cause
		PG_EverPreg_t0=rep_ever_preg
		PG_MenarcheAge=rep_age_menarche_cat

		DR315_HR_BCAny_Adol	 	=rep_bc_ado
		HR_BCAny_Ever_T0=rep_bc_ever
		HR_HRT_Ever_T0=rep_hrt_ever
	;
	drop AgeExact_Baseline
		HR_BCAny_MinAge_T0
		HR_BCDepo_MinAge
		HR_BCIUDh_MinAge_T0
		HR_BCIUDpatc_MinAge
		HR_BCNorp_MinAge
		HR_BCothr_MinAge
		HR_BCpatc_MinAge
		HR_BCpillPatcRing_MinAge
		HR_BCpill_MinAge_T0
		HR_MenopauseAgeExact_T0
		DR315_HR_BCAny_Adol_Yrs
		DR315_HR_BCDepo_Adol
		DR315_HR_BCDepo_Adol_Yrs
		DR315_HR_BCIUDh_Adol
		DR315_HR_BCIUDh_Adol_Yrs
		DR315_HR_BCNorp_Adol
		DR315_HR_BCNorp_Adol_Yrs
		DR315_HR_BCPill_Adol
		DR315_HR_BCPill_Adol_Yrs
		DR315_HR_BCothr_Adol
		DR315_HR_BCothr_Adol_Yrs
		DR315_HR_BCpatc_Adol
		DR315_HR_BCpatc_Adol_Yrs
		HR_Menopause_T0
		PG_AgeFirstTermPG_T0
		PG_AgeLastTermPG_T0
		PG_BreastTotal_t0
		PG_LastTermPGIndex_T0

	;
run;

data ss_reprod_hormone;
	set ss_reprod_hormone;
	array change _numeric_;

	do over change;
		if change in (. .A, .B, .C, .D, .E, .F, .G, .H, .I, .J, .K, .L, .M, .N, .O, .P, .Q, .R, .S, .T, .U, .V, .W, .X, .Y, .Z ) then
			change=-1;
	end;
run;

data ss_reprod_hormone;
	set ss_reprod_hormone;
	array change 
		rep_age_menarche_cont
		rep_bc_ado_dur_cont
		rep_bc_min_age_cont
		rep_br_dev_age_cont
		rep_br_feed_dur
		rep_combined_ado_dur_cont
		rep_combined_min_age_cont
		rep_first_preg_cont
		rep_last_preg_cont
		rep_meno_age_cont
		rep_nb_preg_cont
		rep_proges_ado_dur_cont
		rep_proges_min_age_cont
	;

	do over change;
		if change =-1 then
			change=.;
	end;
run;

/*
PROC CONTENTS DATA=ss_reprod_hormone OUT=var_info NOPRINT;
RUN;
DATA variables_with_formats;
  SET var_info;
  WHERE format = '';
  KEEP name label;
RUN;
proc freq data=ss_reprod_hormone;table _numeric_;run;*/
data ss.ss_reprod_hormone;
	set ss_reprod_hormone;
run;

proc datasets library=work nolist;
	delete ss_reprod_hormone;
quit;
