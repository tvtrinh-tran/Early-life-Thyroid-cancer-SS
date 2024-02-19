data ss_smok;
	set original;
	keep psid

		SM_Smoke_T0 
		SM_CurrentPacksPerDayN_T0
		SM_PackYearsTotal_T0	 	 	 	/*CALC: Total Pack Years*/
	SM_AgeStartN_T0
	SM_AgeQuitN_T0
	SM_YrSmokedTotal_T0	 	 	 	/*CALC: Total # Yrs Smoked*/
	SM_ETSAdult_T0
	SM_ETSCaregiver	 	 	 	/*CALC: SM11. Caregiver smoked (age<=18)*/
	SM_ETSChildOther	 	 	 	/*CALC: SM14. Other smoked (age<=18)*/
	SM_ETSChildYears	 	 	 	/*CALC: # years (age<=18) exposed to smoking from caregiver and/or other HH member [SM11-SM16]*/
	SM_ETSAdultYears_T0	 	 	 	/*CALC: # years (age>=19) exposed to smoking [SM17,SM18,SM19]*/
	SM_ETSTotalYears_T0	 	 	 	/*CALC: # years (any age) exposed to smoking [SM_ETSChildYears + SM_ETSAdultYears_T0]*/
	SM_BeforeAge20N
	SM_PackYears0	 	 	 	/*CALC: Pack Years ages 01-09*/
	SM_PackYears1	 	 	 	/*CALC: Pack Years ages 10-19*/
	SM_YrSmoked0	 	 	 	/*CALC: # Yrs Smoked ages 01-09*/
	SM_YrSmoked1	 	 	 	/*CALC: # Yrs Smoked ages 10-19*/
	;
run;

data ss_smok;
	set ss_smok;

	if SM_Smoke_T0>=0 then
		smok_status=SM_Smoke_T0;
	else smok_status = -1;

	sm_pack_yr_cont = SM_PackYearsTotal_T0;

	if SM_Smoke_T0 = 0 then
		sm_pack_yr_cat = 0;
	else if 0<ceil(SM_PackYearsTotal_T0)<=10 then
		sm_pack_yr_cat = 1;
	else if 10<ceil(SM_PackYearsTotal_T0)<=20 then
		sm_pack_yr_cat = 2;
	else if SM_PackYearsTotal_T0>20 then
		sm_pack_yr_cat=3;
	else sm_pack_yr_cat = 4;

	sm_age_start_smok_cont=SM_AgeStartN_T0;

	if SM_Smoke_T0 = 0 then
		sm_age_start_smok_cat = 0;
	else if 0<ceil(SM_AgeStartN_T0)<=15 then
		sm_age_start_smok_cat = 1;
	else if 15<ceil(SM_AgeStartN_T0)<20 then
		sm_age_start_smok_cat = 2;
	else if SM_AgeStartN_T0>=20 then
		sm_age_start_smok_cat = 3;
	else sm_age_start_smok_cat = 4;

	sm_age_stop_smok_cont=SM_AgeQuitN_T0;

	if SM_Smoke_T0 = 0 then
		sm_age_stop_smok_cat = 0;
	else if 0<ceil(SM_AgeQuitN_T0)<=20 then
		sm_age_stop_smok_cat = 1;
	else if 20<ceil(SM_AgeQuitN_T0)<=30 then
		sm_age_stop_smok_cat = 2;
	else if 30<ceil(SM_AgeQuitN_T0)<=40 then
		sm_age_stop_smok_cat = 3;
	else if SM_AgeQuitN_T0>40 then
		sm_age_stop_smok_cat = 4;
	else sm_age_stop_smok_cat = 5;

	sm_yr_smok_cont=SM_YrSmokedTotal_T0;

	if SM_Smoke_T0 = 0 then
		sm_yr_smok_cat = 0;
	else if 0<ceil(SM_YrSmokedTotal_T0)<=10 then
		sm_yr_smok_cat = 1;
	else if 10<ceil(SM_YrSmokedTotal_T0)<=20 then
		sm_yr_smok_cat = 2;
	else if 20<ceil(SM_YrSmokedTotal_T0)<=30 then
		sm_yr_smok_cat = 3;
	else if SM_YrSmokedTotal_T0>30 then
		sm_yr_smok_cat = 4;
	else sm_yr_smok_cat = 5;

	sm_ETS_before18 = max(of SM_ETSCaregiver SM_ETSChildOther);

	if sm_ETS_before18 not in (0 1) then
		sm_ETS_before18 = -1;

	sm_ETS_before18_yr_cont= SM_ETSChildYears;

	if sm_ETS_before18 = 0 then
		sm_ETS_before18_yr_cat = 0;
	else if 0<ceil(SM_ETSChildYears)<=10 then
		sm_ETS_before18_yr_cat = 1;
	else if 10<ceil(SM_ETSChildYears)<=20 then
		sm_ETS_before18_yr_cat = 2;
	else sm_ETS_before18_yr_cat = 3;

	sm_ETS_ever = max(of sm_ETS_before18 SM_ETSAdult_T0);
	sm_ETS_total_yr_cont=SM_ETSTotalYears_T0;

	if sm_ETS_ever= 0 then
		sm_ETS_total_yr_cat = 0;
	else if 0<ceil(SM_ETSTotalYears_T0)<=10 then
		sm_ETS_total_yr_cat = 1;
	else if 10<ceil(SM_ETSTotalYears_T0)<=20 then
		sm_ETS_total_yr_cat = 2;
	else if 20<ceil(SM_ETSTotalYears_T0)<=30 then
		sm_ETS_total_yr_cat = 3;
	else if SM_ETSTotalYears_T0>30 then
		sm_ETS_total_yr_cat=4;
	else sm_ETS_total_yr_cat = 5;

	if SM_BeforeAge20N>=0 then
		smok_before20 = SM_BeforeAge20N;
	else smok_before20=-1;

	/* limited number
	pack_yr_0109_cont = SM_PackYears0;
	if sm_before20 = 0 then pack_yr_0109_cat = 0;
		else if 0<SM_PackYears0<=5 then pack_yr_0109_cat = 1;
	else if 5<SM_PackYears0<=10 then pack_yr_0109_cat = 2;
	else if 10<SM_PackYears0<=15 then pack_yr_0109_cat = 3;
	else if SM_PackYears0>15 then pack_yr_0109_cat = 4;
	else pack_yr_0109_cat = 5;*/
	sm_pack_yr_1019_cont = SM_PackYears1;

	if SM_Smoke_T0 = 0 then
		sm_pack_yr_1019_cat = 0;
	else if SM_Smoke_T0 >0 and smok_before20 = 1 then do; 
	if 0<ceil(SM_PackYears1)<=5 then
		sm_pack_yr_1019_cat = 1;
	else if 5<SM_PackYears1 then
		sm_pack_yr_1019_cat = 2; 
	else sm_pack_yr_1019_cat = 4;end;
	else if SM_Smoke_T0 >0 and smok_before20 = 0 then sm_pack_yr_1019_cat = 3;
	else sm_pack_yr_1019_cat = 4;
	sm_pack_yr_before20_cont = SM_PackYears0+SM_PackYears1;

	if SM_Smoke_T0 = 0 then
		sm_pack_yr_before20_cat = 0;
	else if SM_Smoke_T0 >0 and smok_before20 = 1 then do; 
	if 0<ceil(sm_pack_yr_before20_cont)<=5 then
		sm_pack_yr_before20_cat = 1;
	else if 5<sm_pack_yr_before20_cont then
		sm_pack_yr_before20_cat = 2;
	else sm_pack_yr_before20_cat = 4;end;
	else if SM_Smoke_T0 >0 and smok_before20 = 0 then sm_pack_yr_before20_cat = 3;
	else sm_pack_yr_before20_cat = 4;

	/* limited number
	yr_smok_0109_cont=SM_YrSmoked0;
	if sm_before20 = 0 then yr_smok_0109_cat = 0;
		else if 0<SM_YrSmoked0<=5 then yr_smok_0109_cat = 1;
	else if 5<SM_YrSmoked0<=10 then yr_smok_0109_cat = 2;
	else yr_smok_0109_cat = 3;*/
	sm_yr_smok_1019_cont=SM_YrSmoked1;

	if SM_Smoke_T0 = 0 then
		sm_yr_smok_1019_cat = 0;
	else if SM_Smoke_T0 >0 and smok_before20 = 1 then do; 
	if 0<ceil(SM_YrSmoked1)<=5 then
		sm_yr_smok_1019_cat = 1;
	else if 5<ceil(SM_YrSmoked1)<=10 then
		sm_yr_smok_1019_cat = 2;
	else sm_yr_smok_1019_cat = 4;end;
	else if SM_Smoke_T0 >0 and smok_before20 = 0 then  sm_yr_smok_1019_cat = 3;
		else sm_yr_smok_1019_cat = 4;
sm_yr_smok_before20_cont=SM_YrSmoked0+SM_YrSmoked1;

	if SM_Smoke_T0 = 0 then
		sm_yr_smok_before20_cat = 0;
	else if SM_Smoke_T0 >0 and smok_before20 = 1 then do; 
	if 0<ceil(sm_yr_smok_before20_cont)<=5 then
		sm_yr_smok_before20_cat = 1;
	else if 5<ceil(sm_yr_smok_before20_cont)<=10 then
		sm_yr_smok_before20_cat = 2;
	else sm_yr_smok_before20_cat = 4;end;
	else if SM_Smoke_T0 >0 and smok_before20 = 0 then  sm_yr_smok_before20_cat = 3;
	else sm_yr_smok_before20_cat = 4;

	format 
	smok_status smok.
	sm_pack_yr_cat pack_yr. 
	sm_pack_yr_1019_cat sm_pack_yr_before20_cat packyr_child. 
	sm_age_start_smok_cat age_start_smok. 
	sm_age_stop_smok_cat age_stop_smok.
	sm_yr_smok_cat yr_smok.
	sm_yr_smok_1019_cat sm_yr_smok_before20_cat yr_smok_child.
	smok_before20 sm_ETS_before18 sm_ETS_ever yesno.
	sm_ETS_before18_yr_cat ETS_child_yr.
	sm_ETS_total_yr_cat ETS_total_yr.
	;
run;

data ss_smok;
	set ss_smok;
	drop SM_Smoke_T0 
		SM_CurrentPacksPerDayN_T0
		SM_PackYearsTotal_T0	 	 	 	/*CALC: Total Pack Years*/
	SM_AgeStartN_T0
	SM_AgeQuitN_T0
	SM_YrSmokedTotal_T0	 	 	 	/*CALC: Total # Yrs Smoked*/
	SM_ETSAdult_T0
	SM_ETSCaregiver	 	 	 	/*CALC: SM11. Caregiver smoked (age<=18)*/
	SM_ETSChildOther	 	 	 	/*CALC: SM14. Other smoked (age<=18)*/
	SM_ETSChildYears	 	 	 	/*CALC: # years (age<=18) exposed to smoking from caregiver and/or other HH member [SM11-SM16]*/
	SM_ETSAdultYears_T0	 	 	 	/*CALC: # years (age>=19) exposed to smoking [SM17,SM18,SM19]*/
	SM_ETSTotalYears_T0	 	 	 	/*CALC: # years (any age) exposed to smoking [SM_ETSChildYears + SM_ETSAdultYears_T0]*/
	SM_BeforeAge20N
	SM_PackYears0	 	 	 	/*CALC: Pack Years ages 01-09*/
	SM_PackYears1	 	 	 	/*CALC: Pack Years ages 10-19*/
	SM_YrSmoked0	 	 	 	/*CALC: # Yrs Smoked ages 01-09*/
	SM_YrSmoked1	 	 	 	/*CALC: # Yrs Smoked ages 10-19*/
	;
run;

data ss_smok;
	set ss_smok;
	array change _numeric_;

	do over change;
		if change in (. .A, .B, .C, .D, .E, .F, .G, .H, .I, .J, .K, .L, .M, .N, .O, .P, .Q, .R, .S, .T, .U, .V, .W, .X, .Y, .Z ) then
			change=-1;
	end;
run;

data ss_smok;
	set ss_smok;
	array change 
	sm_ETS_before18_yr_cont
	sm_ETS_total_yr_cont
	sm_age_start_smok_cont
	sm_age_stop_smok_cont
	sm_pack_yr_1019_cont
	sm_pack_yr_before20_cont
	sm_pack_yr_cont
	sm_yr_smok_1019_cont
	sm_yr_smok_before20_cont
	sm_yr_smok_cont
	;

	do over change;
		if change =-1 then
			change=.;
	end;
run;

/*
PROC CONTENTS DATA=ss_smok OUT=var_info NOPRINT;
RUN;
DATA variables_with_formats;
  SET var_info;
  WHERE format = '';
  KEEP name label;
RUN;
proc freq data=ss.ss_smok;table _numeric_;run;*/
data ss.ss_smok;
	set ss_smok;
run;

proc datasets library=work nolist;
	delete ss_smok;
quit;
