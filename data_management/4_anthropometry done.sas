data ss_anthropometry;
	set original;
	keep
		psid

		/*AN1	 	 	 	    /*AN1. CALC: Current height in inches after analytic edits [AN1ft,AN1ins,AN1cms]*/

	/*AN2	 	 	 	 	/*AN2. CALC: Tallest height in inches after analytic edits [AN2ft,AN2ins,AN2cms]*/
	AN3	 	 	 	 	    /*AN3. CALC: Age first reached tallest height after analytic edits*/
	AN4	 	 	 	 	    /*AN4. Relative height (age 10) recoded to (1=shorter, 2=same, 3=taller)*/

	/*AN5	 	 	 	 	/*AN5. Current weight in lbs after analytic edits [AN5,AN5no,AN5un]*/
	/*AN6	 	 	 	 	/*AN6. Max weight not preg/breastfeed in lbs after analytic edits [AN6,AN6no,AN6un]*/
	/*AN7	 	 	 	 	/*AN7. Age first weighed most*/
	/*AN8	 	 	 	 	/*AN8. Max weight # yrs [AN8,AN8yrs,AN8mos]*/
	/*AN9	 	 	 	 	/*AN9. Min weight since age 20 in lbs after analytic edits [AN9,AN9no,AN9un]*/
	/*AN10	 	 	 	 	/*AN10. Age first weighed least*/
	/*AN11	 	 	 	 	/*AN11. Min weight # yrs [AN11,AN11yrs,AN11mos]*/
	/*AN12	 	 	 	 	/*AN12. Location of first weight gain*/
	/*AN15	 	 	 	 	/*AN15. # times lost/gained 20+ lbs, after analytic edits*/
	/*AN16	 	 	 	 	/*AN16. Avg weight in 30s in lbs after analytic edits [AN16,AN16no,AN16un]*/
	AN17	 	 		  	/*AN17. Relative weight (teens) recoded to (1=lighter, 2=same, 3=heavier)*/
	AN18	 	 		  	/*AN18. Relative weight (age 10) recoded to (1=lighter, 2=same, 3=heavier)*/

	/*AN3flag	 		  	/*AN3. FLAG: midpoint used for AN3 based on response to AN3a*/
	/*AN_AgeExact	 		  	/*CALC: Age (exact) at questionnaire completion [(ANDATE - DOB)/365.25]*/
	/*AN_BMI	 	 		  	/*CALC: Current body mass index, kg/m**2 [AN1 & AN5] (EX_BMI_CDC is preferred measure where available)*/

	/*AN_BMI30s	 		  	/*CALC: Average BMI at age 30, kg/m**2 [AN2 & AN16]*/
	/*AN_BMI30s_CDC		  	/*CALC: Average BMI at age 30 categorized per CDC*/

	/*AN_BMI_CDC	 		  	/*CALC: current body mass index categorized per CDC (EX_BMI_CDC is preferred measure where available)*/
	/*AN_BMImax	 		  	/*CALC: Maximum BMI, kg/m**2 [AN2 & AN6]*/
	/*AN_BMImax_CDC		  	/*CALC: Maximum BMI categorized per CDC*/
	/*AN_BMImin	 		  	/*CALC: Minumum BMI, kg/m**2 [AN2 & AN9]*/
	/*AN_BMImin_CDC		  	/*CALC: Minumum BMI categorized per CDC*/
	EX_BMI_CDC_final  	 	/*CALC: final BMI categorized per CDC [EX_BMI_FINAL]*/
	EX_BMI_final	 	 	/*CALC: final BMI (kg/m**2) [EX_WEIGHT_FINAL, EX_HEIGHT_FINAL]*/

	/*EX_DBP	 	 	 	/*CALC: Average diastolic blood pressure after cleaning for implausible values (first reading excluded in presence of additional readings)*/
	/*EX_DBP_Flag	 	 	/*FLAG: EX_DBP based on single reading*/
	/*EX_HipFlag	 	 	 	/*FLAG: Hip if EX20 minimum difference >= 2 inches*/
	/*EX_NoQx	 	 	 	 	/*FLAG: No EX QX available*/
	/*EX_SBP	 	 	 	/*CALC: Average systolic blood pressure after cleaning for implausible values (first reading excluded in presence of additional readings)*/
	/*EX_SBP_Flag	 	 	/*FLAG: EX_SBP based on single reading*/
	/*EX_Visit_AgeExact	 	/*CALC: Age (exact) at questionnaire completion [(EX_Visit_Date - DOB)/365.25]*/
	/*EX_WaistFlag	 	 	/*FLAG: Waist if EX17 minimum difference >= 2 inches*/
	EX_WaistHip	 	 	 	/*CALC: Waist / Hip ratio measurements examiner data*/

	/*Ex_Height_final	 	 	/*CALC: final height (in) from Examiner data (see EX_HEIGHT_TYPE_FINAL for method)*/
	/*Ex_Height_type_final	/*CALC: method used to determine final height in EX_HEIGHT_FINAL*/
	/*Ex_Hip	 	 	 	 	/*CALC: hip measurement (in) from Examiner data*/
	/*Ex_Waist	 	 	    /*CALC: waist measurement (in) from Examiner data*/
	/*Ex_Weight_final	 	    /*CALC: final weight (lbs) from Examiner data (see EX_WEIGHT_TYPE_FINAL for method)*/
	/*Ex_Weight_type_final  /*CALC: method used to determine final weight in EX_WEIGHT_FINAL*/
	;
run;



data ss_anthropometry;
	set ss_anthropometry;
	format
	AN4	 	 	 	 	  AN4R_modif.  /*AN4. Relative height (age 10) recoded to (1=shorter, 2=same, 3=taller)*/
	AN17	 	 		  AN17R_modif.	/*AN17. Relative weight (teens) recoded to (1=lighter, 2=same, 3=heavier)*/
	AN18	 	 		  AN17R_modif.	/*AN18. Relative weight (age 10) recoded to (1=lighter, 2=same, 3=heavier)*/
	AN_BMI30s_CDC EX_BMI_CDC_final  	  BMICDC_modif.	/*CALC: final BMI categorized per CDC [EX_BMI_FINAL]*/
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

data ss.ss_anthropometry;
	set ss_anthropometry;
run;

proc datasets library=work nolist;
	delete ss_anthropometry;
quit;
/*
PROC CONTENTS DATA=ss_anthropometry OUT=var_info NOPRINT;
RUN;
DATA variables_with_formats;
  SET var_info;
  WHERE format = '';
  KEEP name label;
RUN;
proc freq data=ss_anthropometry;table _numeric_;run;*/
