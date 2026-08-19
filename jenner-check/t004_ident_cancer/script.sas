/* Adapted from data_management/1 ident_cancer done.sas (original repo file)
   -- the script that defines the thyroid-cancer outcome variables the rest
   of the pipeline depends on. Same substitution approach as the other
   bundles: `original` is synthetic (10 fabricated participants), LIBNAME
   ss.* output redirected to WORK. The exclusion, competing-risk, staging
   and DTC-histology derivation logic (including the PROC RANK birth-year
   split and its by-psid merge back) runs unmodified. */

data ss_ident_cancer;
	set original;
	keep psid

		Age_Baseline	 	 	 	/*Age_Baseline*/
	AgeExact_Baseline	 	 	 	/*AgeExact_Baseline*/

	Birth_Year	 	 	 	/*Birth_Year*/

	DR315_OthCa_Inv_DxAgeExact	 	 	 	/*DR315_OthCa_Inv_DxAgeExact*/
	DR315_OthCa_Inv_DxPreBaseline	 	 	 	/*DR315_OthCa_Inv_DxPreBaseline*/
	DR315_OthCa_Inv_Event	 	 	 	/*DR315_OthCa_Inv_Event*/
	FU_MORT_Event
	FU_MORT_EOFAgeExact			/*CALC: Age (exact) at End of Follow-Up for Mortality*/
	FU_ThyCa_DxAgeExact	 	 	 	/*FU_ThyCa_DxAgeExact*/
	FU_ThyCa_DxBehav01	 	 	 	/*FU_ThyCa_DxBehav01*/
	FU_ThyCa_DxGrade	 	 	 	/*FU_ThyCa_DxGrade*/
	FU_ThyCa_DxHist01	 	 	 	/*FU_ThyCa_DxHist01*/
	FU_ThyCa_DxHist02	 	 	 	/*FU_ThyCa_DxHist02*/
	FU_ThyCa_DxPreBaseline	 	 	 	/*FU_ThyCa_DxPreBaseline*/
	FU_ThyCa_DxReportSource	 	 	 	/*FU_ThyCa_DxReportSource*/
	FU_ThyCa_DxStage	 	 	 	/*FU_ThyCa_DxStage*/
	FU_ThyCa_EOFAgeExact	 	 	 	/*FU_ThyCa_EOFAgeExact*/
	FU_ThyCa_Event	 	 	 	/*FU_ThyCa_Event*/
	FU_ThyCa_TumorSizeLarg	 	 	 	/*FU_ThyCa_TumorSizeLarg*/

	PX_Chemo	 	 	 	/*CALC: PX6. Ever chemotherapy (yes/no)*/
	PX_Radiation	 	 	 	/*CALC: PX7. Ever radiation therapy (yes/no)*/
	;
run;

data ss_ident_cancer;
	set ss_ident_cancer;

	/*******cancer at baseline********/
	if FU_ThyCa_DxPreBaseline in (1 .U .M) or DR315_OthCa_Inv_DxPreBaseline in (1 .U .M) then
		ident_cancer_bl=1;
	else ident_cancer_bl=0;

	/*******chemotherapy or radiation therapy for cancer before baseline********/
	if max(of PX_Chemo	PX_Radiation)=1 then
		ident_treatment_cancer_bl = 1;
	else ident_treatment_cancer_bl = 0;

	/****FU*****/
	ident_EOF = min(of FU_ThyCa_EOFAgeExact DR315_OthCa_Inv_DxAgeExact);
	ident_FU_year = ident_EOF-Ageexact_baseline; /*FU could be negative due to prevalent cancer at baseline, when excluding prevalent cancer at baseline, FU is alright*/

	/*****Differentiated thyroid cancer******/
	if FU_ThyCa_Event=1 and FU_ThyCa_EOFAgeExact <= ident_EOF and
	FU_ThyCa_DxGrade not in (2 3) and
	FU_ThyCa_DxHist01 not in (8021 8265 8346 8347 8510 9084) and
	FU_ThyCa_DxHist02 not in (8021 8265 8346 8347 8510 9084)
	then ident_DTC=1;
	else ident_DTC=0;

	if FU_ThyCa_Event ne 1 or (FU_ThyCa_Event=1 and FU_ThyCa_EOFAgeExact > ident_EOF) then
		ident_TC_all = 0;
	else if ident_DTC = 1 then ident_TC_all = 1;
	else if FU_ThyCa_DxGrade in (2 3) then ident_TC_all = 2;
	else if FU_ThyCa_DxHist01 = 8021 then ident_TC_all = 3;
	else if FU_ThyCa_DxHist01 in (8346 8347 8510) then ident_TC_all = 4;
	else if FU_ThyCa_DxHist01 in (8265 9084) then ident_TC_all = 5;
	else ident_TC_all = 6;

	/*In our data, consider for PTC: 8260, 8340-8344; for FTC: 8290, 8330, 8331; 8000 (NOS), 8010 (NOS) and missing, coded as Unknown*/
	if ident_DTC=0 then
		ident_DTC_histo=0 /*no DTC*/;
	else if ident_DTC=1 and FU_ThyCa_DxHist01 in (8260 8340 8341 8342 8343 8344) then
		ident_DTC_histo=1 /*PTC*/;
	else if ident_DTC=1 and FU_ThyCa_DxHist01 in (8290 8330 8331 8335) then
		ident_DTC_histo=2 /*FTC*/;
	else if ident_DTC=1  then
		ident_DTC_histo = 3 /*Unknown*/;

	/*Medically confirmed*/
	if ident_DTC=1 and FU_ThyCa_DxReportSource in (1 8) then ident_DTC_source = 1;
	else ident_DTC_source = 0;

	/*stage AJCC7*/
	if ident_DTC=0 then
		ident_DTC_stage_AJCC7=0 /*no DTC*/;
	else if ident_DTC=1 and FU_ThyCa_DxStage = "I" then
		ident_DTC_stage_AJCC7=1 /*I*/;
	else if ident_DTC=1 and FU_ThyCa_DxStage = "II" then
		ident_DTC_stage_AJCC7=2 /*II*/;
	else if ident_DTC=1 and FU_ThyCa_DxStage = "III" then
		ident_DTC_stage_AJCC7=3 /*III*/;
	else if ident_DTC=1 and FU_ThyCa_DxStage in ("IVa" "IVc")  then
		ident_DTC_stage_AJCC7=4 /*IV*/;
	else if ident_DTC=1 then
		ident_DTC_stage_AJCC7=5 /*Unknown*/;

	/*Tumor size*/
	if ident_DTC=0 then
		ident_DTC_size=0;
	else if ident_DTC=1 and 0<FU_ThyCa_TumorSizeLarg <1 then
		ident_DTC_size=1;
	else if ident_DTC=1 and 1<=FU_ThyCa_TumorSizeLarg<2 then
		ident_DTC_size=2;
	else if ident_DTC=1 and 2<=FU_ThyCa_TumorSizeLarg<4 then
		ident_DTC_size=3;
	else if ident_DTC=1 and FU_ThyCa_TumorSizeLarg >=4 then
		ident_DTC_size=4;
	else if ident_DTC=1 then
		ident_DTC_size=5 /*Unknown*/;

	/*Invassive DTC (y/n)*/
	if ident_DTC=0 then
		ident_DTC_inv=0 /*no DTC*/;
	else if FU_ThyCa_DxBehav01 = 3 then
		ident_DTC_inv = 1;
	else ident_DTC_inv=0;

	/*******Competing risks ( other invassive cancer diagnosis and death)*******/
	if ident_DTC=1 then
		ident_compete=1;
	else if (DR315_OthCa_Inv_Event=1 and DR315_OthCa_Inv_DxAgeExact <= ident_EOF) or
	(FU_MORT_Event =1 and FU_MORT_EOFAgeExact<=ident_EOF) then
		ident_compete=2;
	else ident_compete=0;

proc rank data=ss_ident_cancer
     groups=2
     out=group(keep=psid ident_birth_year );
var Birth_Year ;
ranks ident_birth_year;
run;
data ss_ident_cancer;
merge ss_ident_cancer group;
by psid;
run;

data ss_ident_cancer;
set ss_ident_cancer;
format ident_DTC_histo histo. ident_DTC_stage_AJCC7 ajcc_seven. ident_DTC_inv invassive. ident_DTC_size size. ident_birth_year birth_year. ident_TC_all not_DTC.;
rename FU_ThyCa_DxReportSource = ident_DTC_source_detail;
run;

data want_ss_ident_cancer;
	set ss_ident_cancer;
	keep
		psid
		Age_Baseline
		AgeExact_Baseline
		ident_birth_year
		ident_cancer_bl
		ident_treatment_cancer_bl
		ident_DTC
		ident_TC_all
		ident_DTC_histo
		ident_DTC_stage_AJCC7
		ident_DTC_size
		ident_DTC_inv
		ident_DTC_source
		ident_DTC_source_detail
		FU_ThyCa_DxHist01
		FU_ThyCa_DxGrade
		ident_FU_year
		ident_EOF
		ident_compete
		PX_Chemo
		PX_Radiation;
	rename Age_Baseline=ident_age_bl
		AgeExact_Baseline=ident_ageexact_bl
;
run;

proc print data=want_ss_ident_cancer noobs;
	title "ss_ident_cancer (bundle output; original writes to ss.ss_ident_cancer)";
run;

proc datasets library=work nolist;
	delete ss_ident_cancer group;
quit;
