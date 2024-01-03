data ss_alc;
	set original;
	keep psid
		/*AL_EverBinge	/*CALC: Ever drink 4 or more in one sitting [AL_BingeC,AL_Binge1-AL_Binge7]*/
		AL_DrinksPY1	/*CALC: Ages 5-19, Total # drinks per year in the years drank*/
		/*AL_BingeC	/*CALC: AL8. Past 12 mos, ever drink 4 or more in one sitting*/
		/*AL_GramsPDC	/*CALC: Alcohol intake in g/day, current (past 12 months) [14g*AL_DrinksPWC/7]*/
		/*AL_YearsDrink1	/*CALC: AL11. Ages 5-19, # years drank alcohol*/
		/*AL_YrMiss1	/*CALC: AL11. Ages 5-19, # years missing*/
		/*AL_Binge1	/*CALC: AL15. Ages 5-19, ever drink 4 or more in one sitting*/
		AL_Time1	/*CALC: AL16. Ages 5-19, # times per year drank 4+ drinks, during drinking years (9995=Chronic) [AL16no,AL16un]*/
		/*AL_DrinksPW1	/*CALC: Ages 5-19, # drinks per week [AL14*AL12]*/
		/*AL_GramsPD1	/*CALC: Alcohol intake in g/day, ages 5-19 [14g*AL_DrinksPW1/7]*/
		/*AL_Status_T0	/*CALC: Alcohol status through baseline*/
		AL_StatusCat_T0	/*CALC: Alcohol status (categorical) through baseline*/
		/*AL_DrinksPWC_T0	/*CALC: Current drinks per week at baseline*/
		AL_StartAge_T0	/*CALC: Age started drinking alcohol through baseline*/
		/*AL_QuitAge_T0	/*CALC: Age quit drinking alcohol through baseline (Former drinkers only)*/
		/*AL_DrinksPWTot_T0	/*CALC: Ages 5-92, average # drinks per week through baseline*/
		/*AL_DrinksPYTot_T0	/*CALC: Ages 5-92, Average # drinks per year through baseline*/
		/*AL_YearsDrinkTot_T0	/*CALC: Ages 5-92, Total # years drank alcohol through baseline*/
		/*AL_YrmissTot_T0	/*CALC: Ages 5-92, Total # years missing through baseline*/
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

/*
PROC CONTENTS DATA=ss_alc OUT=var_info NOPRINT;
RUN;
DATA variables_with_formats;
  SET var_info;
  WHERE format = '';
  KEEP name label;
RUN;
proc freq data=ss_alc;table _numeric_;run;*/
data ss.ss_alc;
	set ss_alc;
run;

proc datasets library=work nolist;
	delete ss_alc;
quit;
