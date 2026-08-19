/* Adapted from data_management/4_anthropometry done.sas (original repo file).
   Same substitution approach as t001: `original` is synthetic (10 fabricated
   participants), LIBNAME ss.* output redirected to WORK, everything else —
   the format/rename/derive/missing-code-normalization logic — is unmodified. */

data ss_anthropometry;
	set original;
	keep
		psid

	AN3	 	 	 	    /*AN3. CALC: Age first reached tallest height after analytic edits*/
	AN4	 	 	 	    /*AN4. Relative height (age 10) recoded to (1=shorter, 2=same, 3=taller)*/

	AN17	 	 		  	/*AN17. Relative weight (teens) recoded to (1=lighter, 2=same, 3=heavier)*/
	AN18	 	 		  	/*AN18. Relative weight (age 10) recoded to (1=lighter, 2=same, 3=heavier)*/

	EX_BMI_CDC_final  	 	/*CALC: final BMI categorized per CDC [EX_BMI_FINAL]*/
	EX_BMI_final	 	 	/*CALC: final BMI (kg/m**2) [EX_WEIGHT_FINAL, EX_HEIGHT_FINAL]*/

	EX_WaistHip	 	 	 	/*CALC: Waist / Hip ratio measurements examiner data*/
	;
run;



data ss_anthropometry;
	set ss_anthropometry;
	format
	AN4	 	 	 	 	  AN4R_modif.  /*AN4. Relative height (age 10) recoded to (1=shorter, 2=same, 3=taller)*/
	AN17	 	 		  AN17R_modif.	/*AN17. Relative weight (teens) recoded to (1=lighter, 2=same, 3=heavier)*/
	AN18	 	 		  AN17R_modif.	/*AN18. Relative weight (age 10) recoded to (1=lighter, 2=same, 3=heavier)*/
	EX_BMI_CDC_final  	  BMICDC_modif.	/*CALC: final BMI categorized per CDC [EX_BMI_FINAL]*/
	;
run;

data ss_anthropometry;
	set ss_anthropometry;
	rename
	AN4=an_height_age10	 	 	 	 	    /*AN4. Relative height (age 10) recoded to (1=shorter, 2=same, 3=taller)*/
	AN17=an_weight_teen	 	 		  	/*AN17. Relative weight (teens) recoded to (1=lighter, 2=same, 3=heavier)*/
	AN18=an_weight_age10	 	 		  	/*AN18. Relative weight (age 10) recoded to (1=lighter, 2=same, 3=heavier)*/
	EX_BMI_CDC_final=an_bmi_cat  	 	/*CALC: final BMI categorized per CDC [EX_BMI_FINAL]*/
	;
run;

data ss_anthropometry;
	set ss_anthropometry;
	an_age_tallest=AN3*1;
	an_bmi_cont=EX_BMI_final*1;
	an_WaistHip=EX_WaistHip*1;
	drop   AN3
	EX_BMI_final
	EX_WaistHip;
	/*if measured BMI is not available,  reported BMI is not available as well, so used only measured BMI*/
run;

data ss_anthropometry;
	set ss_anthropometry;
	array change _numeric_;

	do over change;
		if change in (. .A, .B, .C, .D, .E, .F, .G, .H, .I, .J, .K, .L, .M, .N, .O, .P, .Q, .R, .S, .T, .U, .V, .W, .X, .Y, .Z ) then
			change=-1;
	end;
run;

/*manage missing data*/
data ss_anthropometry;
	set ss_anthropometry;
	array change
		an_WaistHip
		an_age_tallest
		an_bmi_cont

	;

	do over change;
		if change =-1 then
			change=.;
	end;
run;

proc print data=ss_anthropometry noobs;
	title "ss_anthropometry (bundle output; original writes to ss.ss_anthropometry)";
run;

proc datasets library=work nolist;
	delete ss_anthropometry;
quit;
