/* Adapted from data_management/6_alc done.sas (original repo file).
   Same substitution approach as t001/t002: `original` is synthetic (10
   fabricated participants), LIBNAME ss.* output redirected to WORK, the
   categorization logic (including the ceil() workaround the author notes
   in their own comment) runs unmodified. */

data ss_alc;
	set original;
	keep psid
		AL_DrinksPY1	/*CALC: Ages 5-19, Total # drinks per year in the years drank*/
		AL_Time1	/*CALC: AL16. Ages 5-19, # times per year drank 4+ drinks, during drinking years (9995=Chronic) [AL16no,AL16un]*/
		AL_StatusCat_T0	/*CALC: Alcohol status (categorical) through baseline*/
		AL_StartAge_T0	/*CALC: Age started drinking alcohol through baseline*/
		;
run;


data ss_alc;
	set ss_alc;

	if AL_StatusCat_T0*1 <0 then
		alc_cat = -1;
	else if AL_StatusCat_T0<2 then alc_cat=AL_StatusCat_T0;
	else if AL_StatusCat_T0 = 2 or AL_StatusCat_T0 = 3 then alc_cat = 2;
	else if AL_StatusCat_T0 > 3 then alc_cat = 3;


	alc_drinks_before20_cont = AL_drinksPY1*1;

	if AL_drinksPY1*1<0 then
		alc_drinks_before20_cat = 4;
/* have to use ceil(AL_drinksPY1) instead of AL_drinksPY1 because I got some errors when cross checking. Probably due to the default formatting of AL_drinksPY1*/
	else if ceil(AL_drinksPY1)=0 then
		alc_drinks_before20_cat = 0;
	else if ceil(AL_drinksPY1)<60 then
		alc_drinks_before20_cat = 1;
	else if ceil(AL_drinksPY1)<230 then
		alc_drinks_before20_cat = 2;
	else if ceil(AL_drinksPY1)>=230 then
		alc_drinks_before20_cat = 3;

	alc_binge_time_519_cont=AL_Time1*1;

	if AL_Time1*1<0 then
		alc_binge_time_519_cat = 4;
	else if AL_Time1=0 then
		alc_binge_time_519_cat = 0;
	else if AL_Time1<25 then
		alc_binge_time_519_cat = 1;
	else if AL_Time1<249 then
		alc_binge_time_519_cat = 2;
	else if AL_Time1>=250 then
		alc_binge_time_519_cat = 3;

	alc_age_start_reg_cont=AL_StartAge_T0*1;

	if AL_StatusCat_T0 = 0 then
		alc_age_start_reg_cat = 0;
	else if AL_StartAge_T0 <0 then
		alc_age_start_reg_cat = 4;
	else if 0<AL_StartAge_T0<15 then
		alc_age_start_reg_cat=1;
	else if 0<AL_StartAge_T0<20 then
		alc_age_start_reg_cat=2;
	else alc_age_start_reg_cat = 3;

	format
	alc_cat alc_status.
	alc_drinks_before20_cat drinkPY.
	alc_binge_time_519_cat binge.
	alc_age_start_reg_cat alc_age_start.
	;
	drop
		AL_StatusCat_T0   AL_StartAge_T0           AL_Time1            AL_DrinksPY1;
run;

data ss_alc;
	set ss_alc;
	array change _numeric_;

	do over change;
		if change in (. .A, .B, .C, .D, .E, .F, .G, .H, .I, .J, .K, .L, .M, .N, .O, .P, .Q, .R, .S, .T, .U, .V, .W, .X, .Y, .Z ) then
			change=-1;
	end;
run;

data ss_alc;
	set ss_alc;
	array change
		alc_age_start_reg_cont
		alc_drinks_before20_cont
	;

	do over change;
		if change =-1 then
			change=.;
	end;
run;

proc print data=ss_alc noobs;
	title "ss_alc (bundle output; original writes to ss.ss_alc)";
run;

proc datasets library=work nolist;
	delete ss_alc;
quit;
