data ss_ident_cancer;
	set original;
	keep psid

		Age_Baseline	 	 	 	/*Age_Baseline*/
	AgeExact_Baseline	 	 	 	/*AgeExact_Baseline*/

	/*AgeExact_T0	 	 	 	/*AgeExact_T0*/
	/*AgeExact_T1	 	 	 	/*AgeExact_T1*/
	/*AgeExact_T2	 	 	 	/*AgeExact_T2*/
	/*AgeExact_T3	 	 	 	/*AgeExact_T3*/
	/*AgeExact_T4	 	 	 	/*AgeExact_T4*/
	Birth_Year	 	 	 	/*Birth_Year*/

	/*DateSource_T1	 	 	 	/*DateSource_T1*/
	/*DateSource_T2	 	 	 	/*DateSource_T2*/
	/*DateSource_T3	 	 	 	/*DateSource_T3*/
	/*DateSource_T4	 	 	 	/*DateSource_T4*/
	/*DFU_T1	 	 	 	/*DFU_T1*/
	/*DFU_T2	 	 	 	/*DFU_T2*/
	/*DFU_T3	 	 	 	/*DFU_T3*/
	/*DFU_T4	 	 	 	/*DFU_T4*/
	DR315_OthCa_DxAge	 	 	 	/*DR315_OthCa_DxAge*/
	DR315_OthCa_DxAgeExact	 	 	 	/*DR315_OthCa_DxAgeExact*/
	DR315_OthCa_DxDateImputed	 	 	 	/*DR315_OthCa_DxDateImputed*/
	DR315_OthCa_DxPreBaseline	 	 	 	/*DR315_OthCa_DxPreBaseline*/
	DR315_OthCa_DxReportSource	 	 	 	/*DR315_OthCa_DxReportSource*/
	DR315_OthCa_DxType	 	 	 	/*DR315_OthCa_DxType*/
	DR315_OthCa_EOFAge	 	 	 	/*DR315_OthCa_EOFAge*/
	DR315_OthCa_EOFAgeExact	 	 	 	/*DR315_OthCa_EOFAgeExact*/
	DR315_OthCa_Event	 	 	 	/*DR315_OthCa_Event*/
	DR315_OthCa_Inv_DxAge	 	 	 	/*DR315_OthCa_Inv_DxAge*/
	DR315_OthCa_Inv_DxAgeExact	 	 	 	/*DR315_OthCa_Inv_DxAgeExact*/
	DR315_OthCa_Inv_DxDateImputed	 	 	 	/*DR315_OthCa_Inv_DxDateImputed*/
	DR315_OthCa_Inv_DxPreBaseline	 	 	 	/*DR315_OthCa_Inv_DxPreBaseline*/
	DR315_OthCa_Inv_DxReportSource	 	 	 	/*DR315_OthCa_Inv_DxReportSource*/
	DR315_OthCa_Inv_DxType	 	 	 	/*DR315_OthCa_Inv_DxType*/
	DR315_OthCa_Inv_EOFAge	 	 	 	/*DR315_OthCa_Inv_EOFAge*/
	DR315_OthCa_Inv_EOFAgeExact	 	 	 	/*DR315_OthCa_Inv_EOFAgeExact*/
	DR315_OthCa_Inv_Event	 	 	 	/*DR315_OthCa_Inv_Event*/
	FU_MORT_Event
	FU_MORT_EOFAgeExact			/*CALC: Age (exact) at End of Follow-Up for Mortality (Mortality cutoff date or Date of Death, whichever is first) [(FU_MORT_EOFDate - DOB)/365.25]*/
	FU_MORT_EOFDate_Impute		/*FLAG: FU_MORT_EOFDate/Age/AgeExact - imputed (1=yes)*/
	FU_ThyCa_DxAge	 	 	 	/*FU_ThyCa_DxAge*/
	FU_ThyCa_DxAgeExact	 	 	 	/*FU_ThyCa_DxAgeExact*/
	FU_ThyCa_DxBehav01	 	 	 	/*FU_ThyCa_DxBehav01*/
	FU_ThyCa_DxBehav02	 	 	 	/*FU_ThyCa_DxBehav02*/
	FU_ThyCa_DxDateImputed	 	 	 	/*FU_ThyCa_DxDateImputed*/
	FU_ThyCa_DxGrade	 	 	 	/*FU_ThyCa_DxGrade*/
	FU_ThyCa_DxHist01	 	 	 	/*FU_ThyCa_DxHist01*/
	FU_ThyCa_DxHist02	 	 	 	/*FU_ThyCa_DxHist02*/
	FU_ThyCa_DxMultPrimary	 	 	 	/*FU_ThyCa_DxMultPrimary*/
	FU_ThyCa_DxPreBaseline	 	 	 	/*FU_ThyCa_DxPreBaseline*/
	FU_ThyCa_DxReportSource	 	 	 	/*FU_ThyCa_DxReportSource*/
	FU_ThyCa_DxStage	 	 	 	/*FU_ThyCa_DxStage*/
	FU_ThyCa_DxStage_Comments	 	 	 	/*FU_ThyCa_DxStage_Comments*/
	FU_ThyCa_DxStage_M	 	 	 	/*FU_ThyCa_DxStage_M*/
	FU_ThyCa_DxStage_N	 	 	 	/*FU_ThyCa_DxStage_N*/
	FU_ThyCa_DxStage_T	 	 	 	/*FU_ThyCa_DxStage_T*/
	FU_ThyCa_DxType	 	 	 	/*FU_ThyCa_DxType*/
	FU_ThyCa_DxType_Source	 	 	 	/*FU_ThyCa_DxType_Source*/
	FU_ThyCa_EOFAge	 	 	 	/*FU_ThyCa_EOFAge*/
	FU_ThyCa_EOFAgeExact	 	 	 	/*FU_ThyCa_EOFAgeExact*/
	FU_ThyCa_Event	 	 	 	/*FU_ThyCa_Event*/
	FU_ThyCa_NDIDC_Conf	 	 	 	/*FU_ThyCa_NDIDC_Conf*/
	FU_ThyCa_NDIDC_Conf_Source	 	 	 	/*FU_ThyCa_NDIDC_Conf_Source*/
	FU_ThyCa_PrimaryCOD	 	 	 	/*FU_ThyCa_PrimaryCOD*/
	FU_ThyCa_PrimaryCOD_Source	 	 	 	/*FU_ThyCa_PrimaryCOD_Source*/
	FU_ThyCa_TumorNum	 	 	 	/*FU_ThyCa_TumorNum*/
	FU_ThyCa_TumorSizeLarg	 	 	 	/*FU_ThyCa_TumorSizeLarg*/

	/*H_AgeExact	 	 	 	/*H_AgeExact*/
	/*H_SinceAgeExact	 	 	 	/*H_SinceAgeExact*/
	/*HH_PSID	 	 	 	/*HH_PSID*/
	/*LH_AgeExact	 	 	 	/*LH_AgeExact*/
	/*LH_SinceAgeExact	 	 	 	/*LH_SinceAgeExact*/
	/*LL_AgeExact	 	 	 	/*LL_AgeExact*/
	/*PSID	 	 	 	/*PSID*/
	Study	 	 	 	/*Study*/

	/*TH_AgeExact	 	 	 	/*TH_AgeExact*/
	/*TH_SinceAgeExact	 	 	 	/*TH_SinceAgeExact*/
	/*TQ_AgeExact	 	 	 	/*TQ_AgeExact*/
	/*TT_AgeExact	 	 	 	/*TT_AgeExact*/
	/*TT_SinceAgeExact	 	 	 	/*TT_SinceAgeExact*/
	/*HZ_RM_BRCA1	 	 	 	/*CALC: BRCA1 status (from best available source in baseline and follow-up)*/
	/*HZ_RM_BRCA2	 	 	 	/*CALC: BRCA2 status (from best available source in baseline and follow-up)*/
	/*HZ_RM_BRCA1_SOURCE	 	 	 	/*Source for HZ_RM_BRCA1 - MR (medical reports), FHU (Family Health Update), BCFU (breast cancer follow-up self-report) or PX (baseline CATI self-report)*/
	/*HZ_RM_BRCA2_SOURCE	 	 	 	/*Source for HZ_RM_BRCA2 - MR (medical reports), FHU (Family Health Update), BCFU (breast cancer follow-up self-report) or PX (baseline CATI self-report)*/
	/*HR_AromInhibit_Ever	 	 	 	/*HR_AromInhibit_Ever*/
	/*use this for exclusion criteria*/
	/*HR_AromInhibit_MaxAge	 	 	 	/*HR_AromInhibit_MaxAge*/
	/*HR_AromInhibit_MinAge	 	 	 	/*HR_AromInhibit_MinAge*/
	/*HR_AromInhibit_Years	 	 	 	/*HR_AromInhibit_Years*/
	/*HR_AromInhibitcurrent	 	 	 	/*HR_AromInhibitcurrent*/
	/*HR_TMX_Ever	 	 	 	/*CALC: HR12b. Taken tamoxifen or Nolvadex (adjusted for repeating records)*/
	/*HR_TMX_MaxAge	 	 	 	/*CALC: Maximum age used tamoxifen or Nolvadex (ignoring missing)*/
	/*HR_TMX_MinAge	 	 	 	/*CALC: Minimum age used tamoxifen or Nolvadex (ignoring missing)*/
	/*HR_TMX_Years	 	 	 	/*CALC: Total Years used tamoxifen or Nolvadex*/
	/*HR_TMXcurrent	 	 	 	/*FLAG: HR_TMXcurrent. Currently using tamoxifen or Nolvadex [HR19 repeating]*/
	PX_Chemo	 	 	 	/*CALC: PX6. Ever chemotherapy (yes/no) [PX6 repeating]*/
	PX_Radiation	 	 	 	/*CALC: PX7. Ever radiation therapy (yes/no) [PX7 repeating]*/
	REX1_AgeExact	 	 	 	/*CALC: Age (exact) at questionnaire completion [(REX1_Date - DOB)/365.25]*/
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

	/*identify DTC cases, censor moderately or poorly differentiated TC, and censor undifferentiated TC, including  
	(https://ci5.iarc.fr/CI5-XI/Pages/Chapter4.aspx, https://www.naaccr.org/icdo3/ Annotated Histology List – 8/2/23 (corrected misspelling for terms associated with 9505/0 and 9738/1))

	8021	ATC
	8265	"Micropapillary carcinoma,NOS (C18._, C19.9, C20.9)"
	8346	mixed medullary folliculuar
	8347	mixed medullary papillary
	8510	MTC
	9084	Ovary*/
	if FU_ThyCa_Event=1 and FU_ThyCa_DxGrade not in (2 3) and 
	FU_ThyCa_DxHist01 not in (8021 8265 8346 8347 8510 9084) and 
	FU_ThyCa_DxHist02 not in (8021 8265 8346 8347 8510 9084) and 
	FU_ThyCa_EOFAgeExact <= ident_EOF then
		ident_DTC=1;
	else ident_DTC=0;

	/*In our data, consider for PTC: 8260, 8340-8344; for FTC: 8290, 8330, 8331; 8000 (NOS), 8010 (NOS) and missing (n=79), coded as Unknown*/
	if ident_DTC=0 then
		ident_DTC_histo=0 /*no DTC*/;
	else if ident_DTC=1 and FU_ThyCa_DxHist01 in (8260 8340 8341 8342 8343 8344) then
		ident_DTC_histo=1 /*PTC*/;
	else if ident_DTC=1 and FU_ThyCa_DxHist01 in (8290 8330 8331 8335) then
		ident_DTC_histo=2 /*FTC*/;
	else if ident_DTC=1  then
		ident_DTC_histo = 3 /*Unknown*/;

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
format ident_DTC_histo histo. ident_DTC_stage_AJCC7 ajcc_seven. ident_DTC_inv invassive. ident_DTC_size size. ident_birth_year birth_year.;
rename FU_ThyCa_DxReportSource = ident_DTC_source;
run;

data ss.ss_ident_cancer;
	set ss_ident_cancer;
	keep 
		psid
		Age_Baseline
		AgeExact_Baseline
		ident_birth_year
		ident_cancer_bl
		ident_treatment_cancer_bl
		ident_DTC
		ident_DTC_histo
		ident_DTC_stage_AJCC7
		ident_DTC_size
		ident_DTC_inv
		ident_DTC_source
		ident_FU_year
		ident_EOF
		ident_compete;
	rename Age_Baseline=ident_age_bl
		AgeExact_Baseline=ident_ageexact_bl
;
run;

proc datasets library=work nolist;
	delete ss_ident_cancer group;
quit;
