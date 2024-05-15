data ss_illness_treatment;
	set original;
	keep psid
		Age_Baseline
		AgeExact_Baseline
		/*FU_DiabBordPr_DxAge	 	 	 	/*CALC: Borderline diabetes (initial diagnosis) - Age (integer) at diagnosis with imputation for cases missing dxdate (see FU_DiabBordPr_DxDateImputed)*/

	/*FU_DiabBordPr_DxAgeExact	 	 	 	/*CALC: Borderline diabetes (initial diagnosis) - Age (exact) at diagnosis with imputation for cases missing dxdate (see FU_DiabBordPr_DxDateImputed)*/
	/*FU_DiabBordPr_DxDateImputed	 	 	 	/*FLAG: Borderline diabetes (initial diagnosis) - Date/Age at diagnosis imputed*/
	FU_DiabBordPr_DxPreBaseline	 	 	 	/*CALC: Borderline diabetes (initial diagnosis) - Timing around baseline*/

	/*FU_DiabBordPr_DxReportSource	 	 	 	/*CALC: Borderline diabetes (initial diagnosis) - Data source*/
	/*FU_DiabBordPr_DxType	 	 	 	/*CALC: Borderline diabetes (initial diagnosis) - Type*/
	/*FU_DiabBordPr_DxType_Source	 	 	 	/*CALC: Borderline diabetes (initial diagnosis) - Data source for FU_DiabBordPr_DxType*/
	FU_DiabBordPr_Event	 	 	 	/*CALC: Borderline diabetes (initial diagnosis) - Event*/

	/*FU_DiabBordPr_FlagStop	 	 	 	/*FLAG: Borderline diabetes - Participant indicated that they no longer have borderline diabetes at some point*/
	/*FU_DiabBordPr_FlagStopAge	 	 	 	/*CALC: Borderline diabetes - Age at which participant indicated that they no longer have borderline diabetes*/
	/*FU_DiabBordPr_FlagStopAgeExact	 	 	 	/*CALC: Borderline diabetes - Age (exact) at which participant indicated that they no longer have borderline diabetes*/
	/*FU_DiabBordPr_ReportDate_Source	 	 	 	/*CALC: Borderline diabetes (initial diagnosis) - form on which first reported (INTERNAL)*/
	/*FU_Diab_DxAge	 	 	 	/*CALC: Diabetes (initial diagnosis) - Age (integer) at diagnosis with imputation for cases missing dxdate (see FU_Diab_DxDateImputed)*/
	/*FU_Diab_DxAgeExact	 	 	 	/*CALC: Diabetes (initial diagnosis) - Age (exact) at diagnosis with imputation for cases missing dxdate (see FU_Diab_DxDateImputed)*/
	/*FU_Diab_DxDateImputed	 	 	 	/*FLAG: Diabetes (initial diagnosis) - Date/Age at diagnosis imputed*/
	FU_Diab_DxPreBaseline	 	 	 	/*CALC: Diabetes (initial diagnosis) - Timing around baseline*/

	/*FU_Diab_DxReportSource	 	 	 	/*CALC: Diabetes (initial diagnosis) - Data source*/
	/*FU_Diab_DxType	 	 	 	/*CALC: Diabetes (initial diagnosis) - Type*/
	/*FU_Diab_DxType_Source	 	 	 	/*CALC: Diabetes (initial diagnosis) - Data source for FU_Diab_DxType*/
	FU_Diab_Event	 	 	 	/*CALC: Diabetes (initial diagnosis) - Event*/

	/*FU_Diab_FlagStop	 	 	 	/*FLAG: Diabetes - Participant indicated that they no longer have diabetes*/
	/*FU_Diab_FlagStopAge	 	 	 	/*CALC: Diabetes - Age at which participant indicated that they no longer have diabetes*/
	/*FU_Diab_FlagStopAgeExact	 	 	 	/*CALC: Diabetes - Age (exact) at which participant indicated that they no longer have diabetes*/
	/*FU_Diab_ReportDate_Source	 	 	 	/*CALC: Diabetes (initial diagnosis) - form on which first reported (INTERNAL)*/
	/*FU_Diab_Type1a	 	 	 	/*CALC: Diabetes - Diagnosed with Type 1 Diabetes (Type 1 reported or DxAge<35 and continuous insulin use)*/
	/*FU_Diab_Type1a_DxAge	 	 	 	/*CALC: Diabetes - Age diagnosed with Type 1 Diabetes (where FU_Diab_Type1a=yes)*/
	/*FU_Diab_Type1b	 	 	 	/*CALC: Diabetes - Diagnosed with Type 1 Diabetes (Type 1 reported or DxAge<20 (regardless of insulin use) or dx between 20 and 34 and continuous insulin use)*/
	/*FU_Diab_Type1b_DxAge	 	 	 	/*CALC: Diabetes - Age diagnosed with Type 1 Diabetes (where FU_Diab_Type1b=yes)*/
	/*FU_HTNBord_DxAge	 	 	 	/*CALC: Borderline hypertension (initial diagnosis) - Age (integer) at diagnosis with imputation for cases missing dxdate (see FU_HTNBord_DxDateImputed)*/
	/*FU_HTNBord_DxAgeExact	 	 	 	/*CALC: Borderline hypertension (initial diagnosis) - Age (exact) at diagnosis with imputation for cases missing dxdate (see FU_HTNBord_DxDateImputed)*/
	/*FU_HTNBord_DxDateImputed	 	 	 	/*FLAG: Borderline hypertension (initial diagnosis) - Date/Age at diagnosis imputed*/
	/*FU_HTNBord_DxPreBaseline	 	 	 	/*CALC: Borderline hypertension (initial diagnosis) - Timing around baseline*/
	/*FU_HTNBord_DxReportSource	 	 	 	/*CALC: Borderline hypertension (initial diagnosis) - Data source*/
	/*FU_HTNBord_DxType	 	 	 	/*CALC: Borderline hypertension (initial diagnosis) - Type*/
	/*FU_HTNBord_DxType_Source	 	 	 	/*CALC: Borderline hypertension (initial diagnosis) - Data source for FU_HTNBord_DxType*/
	/*FU_HTNBord_Event	 	 	 	/*CALC: Borderline hypertension (initial diagnosis) - Event*/
	/*FU_HTNBord_ReportDate_Source	 	 	 	/*CALC: Borderline hypertension (initial diagnosis) - form on which first reported (INTERNAL)*/
	/*FU_HTN_DxAge	 	 	 	/*CALC: Hypertension (initial diagnosis) - Age (integer) at diagnosis with imputation for cases missing dxdate (see FU_HTN_DxDateImputed)*/
	/*FU_HTN_DxAgeExact	 	 	 	/*CALC: Hypertension (initial diagnosis) - Age (exact) at diagnosis with imputation for cases missing dxdate (see FU_HTN_DxDateImputed)*/
	/*FU_HTN_DxDateImputed	 	 	 	/*FLAG: Hypertension (initial diagnosis) - Date/Age at diagnosis imputed*/
	/*FU_HTN_DxPreBaseline	 	 	 	/*CALC: Hypertension (initial diagnosis) - Timing around baseline*/
	/*FU_HTN_DxReportSource	 	 	 	/*CALC: Hypertension (initial diagnosis) - Data source*/
	/*FU_HTN_DxType	 	 	 	/*CALC: Hypertension (initial diagnosis) - Type*/
	/*FU_HTN_DxType_Source	 	 	 	/*CALC: Hypertension (initial diagnosis) - Data source for FU_HTN_DxType*/
	/*FU_HTN_Event	 	 	 	/*CALC: Hypertension (initial diagnosis) - Event*/
	/*FU_HTN_ReportDate_Source	 	 	 	/*CALC: Hypertension (initial diagnosis) - form on which first reported (INTERNAL)*/
	/*FU_Health	 	 	 	/*FLAG: At least one health update form completed for participant (annual, detailed follow-up [DFU] or next of kin [NOK] form)*/
	/*FU_ThyHyper_DxAge	 	 	 	/*CALC: Hyperthyroidism (initial diagnosis) - Age (integer) at diagnosis with imputation for cases missing dxdate (see FU_ThyHyper_DxDateImputed)*/
	/*FU_ThyHyper_DxAgeExact	 	 	 	/*CALC: Hyperthyroidism (initial diagnosis) - Age (exact) at diagnosis with imputation for cases missing dxdate (see FU_ThyHyper_DxDateImputed)*/
	/*FU_ThyHyper_DxDateImputed	 	 	 	/*FLAG: Hyperthyroidism (initial diagnosis) - Date/Age at diagnosis imputed*/
	FU_ThyHyper_DxPreBaseline	 	 	 	/*CALC: Hyperthyroidism (initial diagnosis) - Timing around baseline*/

	/*FU_ThyHyper_DxReportSource	 	 	 	/*CALC: Hyperthyroidism (initial diagnosis) - Data source*/
	/*FU_ThyHyper_DxType	 	 	 	/*CALC: Hyperthyroidism (initial diagnosis) - Type*/
	/*/`
	*FU_ThyHyper_DxType_Source	 	 	 	/*CALC: Hyperthyroidism (initial diagnosis) - Data source for FU_ThyHyper_DxType*/
	/*FU_ThyHyper_EOFAge	 	 	 	/*CALC: Hyperthyroidism (initial diagnosis) - Age (integer) at End of Follow-Up (date of of diagnosis or censoring) with imputation for cases missing dxdate (see FU_ThyHyper_DxDateImputed)*/
	/*FU_ThyHyper_EOFAgeExact	 	 	 	/*CALC: Hyperthyroidism (initial diagnosis) - Age (exact) at End of Follow-Up (date of of diagnosis or censoring) with imputation for cases missing dxdate (see FU_ThyHyper_DxDateImputed)*/
	FU_ThyHyper_Event	 	 	 	/*CALC: Hyperthyroidism (initial diagnosis) - Event*/

	/*FU_ThyHyper_FLAGCancer	 	 	 	/*FLAG: Excluded post-thyroid cancer self report of hyperthyroidism*/
	/*FU_ThyHyper_FLAGTimingImp	 	 	 	/*FLAG: Hyperthyroidism - Timing of diagnosis around baseline imputed*/
	/*FU_ThyHypo_Congenital	 	 	 	/*FLAG: Hypothyroidism (initial diagnosis) - Congenital*/
	/*/`
	*FU_ThyHypo_DxAge	 	 	 	/*CALC: Hypothyroidism (initial diagnosis) - Age (integer) at diagnosis with imputation for cases missing dxdate (see FU_ThyHypo_DxDateImputed)*/
	/*FU_ThyHypo_DxAgeExact	 	 	 	/*CALC: Hypothyroidism (initial diagnosis) - Age (exact) at diagnosis with imputation for cases missing dxdate (see FU_ThyHypo_DxDateImputed)*/
	/*FU_ThyHypo_DxDateImputed	 	 	 	/*FLAG: Hypothyroidism (initial diagnosis) - Date/Age at diagnosis imputed*/
	FU_ThyHypo_DxPreBaseline	 	 	 	/*CALC: Hypothyroidism (initial diagnosis) - Timing around baseline*/

	/*FU_ThyHypo_DxReportSource	 	 	 	/*CALC: Hypothyroidism (initial diagnosis) - Data source*/
	/*FU_ThyHypo_DxType	 	 	 	/*CALC: Hypothyroidism (initial diagnosis) - Type*/
	/*/`
	*FU_ThyHypo_DxType_Source	 	 	 	/*CALC: Hypothyroidism (initial diagnosis) - Data source for FU_ThyHypo_DxType*/
	/*FU_ThyHypo_EOFAge	 	 	 	/*CALC: Hypothyroidism (initial diagnosis) - Age (integer) at End of Follow-Up (date of of diagnosis or censoring) with imputation for cases missing dxdate (see FU_ThyHypo_DxDateImputed)*/
	/*FU_ThyHypo_EOFAgeExact	 	 	 	/*CALC: Hypothyroidism (initial diagnosis) - Age (exact) at End of Follow-Up (date of of diagnosis or censoring) with imputation for cases missing dxdate (see FU_ThyHypo_DxDateImputed)*/
	FU_ThyHypo_Event	 	 	 	/*CALC: Hypothyroidism (initial diagnosis) - Event*/

	/*FU_ThyHypo_Exogenous	 	 	 	/*FLAG: Hypothyroidism (initial diagnosis) - Medicaments and other exogenous substances*/
	/*FU_ThyHypo_FLAGCancer	 	 	 	/*FLAG: Excluded post-thyroid cancer self report of hypothyroidism*/
	/*FU_ThyHypo_FLAGTimingImp	 	 	 	/*FLAG: Hypothyroidism - Timing of diagnosis around baseline imputed*/
	/*FU_ThyHypo_IodineDeficiency	 	 	 	/*FLAG: Hypothyroidism (initial diagnosis) - iodine-deficiency*/
	/*FU_ThyHypo_PostProcedural	 	 	 	/*FLAG: Hypothyroidism (initial diagnosis) - Post-procedural*/
	/*/`
	*FU_ThyNod_DxAge	 	 	 	/*CALC: Non-toxic goiter/thyroid nodules (initial diagnosis) - Age (integer) at diagnosis with imputation for cases missing dxdate (see FU_ThyNod_DxDateImputed)*/
	/*FU_ThyNod_DxAgeExact	 	 	 	/*CALC: Non-toxic goiter/thyroid nodules (initial diagnosis) - Age (exact) at diagnosis with imputation for cases missing dxdate (see FU_ThyNod_DxDateImputed)*/
	/*FU_ThyNod_DxDateImputed	 	 	 	/*FLAG: Non-toxic goiter/thyroid nodules (initial diagnosis) - Date/Age at diagnosis imputed*/
	FU_ThyNod_DxPreBaseline	 	 	 	/*CALC: Non-toxic goiter/thyroid nodules (initial diagnosis) - Timing around baseline*/

	/*FU_ThyNod_DxReportSource	 	 	 	/*CALC: Non-toxic goiter/thyroid nodules (initial diagnosis) - Data source*/
	/*FU_ThyNod_EOFAge	 	 	 	/*CALC: Non-toxic goiter/thyroid nodules (initial diagnosis) - Age (integer) at End of Follow-Up (date of of diagnosis or censoring) with imputation for cases missing dxdate (see FU_ThyNod_DxDateImputed)*/
	/*FU_ThyNod_EOFAgeExact	 	 	 	/*CALC: Non-toxic goiter/thyroid nodules (initial diagnosis) - Age (exact) at End of Follow-Up (date of of diagnosis or censoring) with imputation for cases missing dxdate (see FU_ThyNod_DxDateImputed)*/
	FU_ThyNod_Event	 	 	 	/*CALC: Non-toxic goiter/thyroid nodules (initial diagnosis) - Event*/

	/*FU_ThyNod_FLAGCancer	 	 	 	/*FLAG: Excluded post-thyroid cancer self report of non-toxic goiter/thyroid nodules*/
	/*FU_ThyNod_FLAGTimingImp	 	 	 	/*FLAG: Non-toxic goiter/thyroid nodules - Timing of diagnosis around baseline imputed*/
	/*FU_ThyOth_Congenital	 	 	 	/*FLAG: Other/unknown thyroid disease/condition  - Congenital*/
	/*FU_ThyOth_DrugInduced	 	 	 	/*FLAG: Other/unknown thyroid disease/condition (initial diagnosis) - Drug-induced thyroiditis*/
	/*FU_ThyOth_DxAge	 	 	 	/*CALC: Other/unknown thyroid disease/condition (initial diagnosis) - Age (integer) at diagnosis with imputation for cases missing dxdate (see FU_ThyOth_DxDateImputed)*/
	/*FU_ThyOth_DxAgeExact	 	 	 	/*CALC: Other/unknown thyroid disease/condition (initial diagnosis) - Age (exact) at diagnosis with imputation for cases missing dxdate (see FU_ThyOth_DxDateImputed)*/
	/*FU_ThyOth_DxDateImputed	 	 	 	/*FLAG: Other/unknown thyroid disease/condition (initial diagnosis) - Date/Age at diagnosis imputed*/
	FU_ThyOth_DxPreBaseline	 	 	 	/*CALC: Other/unknown thyroid disease/condition (initial diagnosis) - Timing around baseline*/

	/*FU_ThyOth_DxReportSource	 	 	 	/*CALC: Other/unknown thyroid disease/condition (initial diagnosis) - Data source*/
	/*FU_ThyOth_DxType	 	 	 	/*CALC: Other/unknown thyroid disease/condition (initial diagnosis) - Type*/
	/*/`
	*FU_ThyOth_DxType_Source	 	 	 	/*CALC: Other/unknown thyroid disease/condition (initial diagnosis) - Data source for FU_ThyOth_DxType*/
	/*FU_ThyOth_EOFAge	 	 	 	/*CALC: Other/unknown thyroid disease/condition (initial diagnosis) - Age (integer) at End of Follow-Up (date of of diagnosis or censoring) with imputation for cases missing dxdate (see FU_ThyOth_DxDateImputed)*/
	/*FU_ThyOth_EOFAgeExact	 	 	 	/*CALC: Other/unknown thyroid disease/condition (initial diagnosis) - Age (exact) at End of Follow-Up (date of of diagnosis or censoring) with imputation for cases missing dxdate (see FU_ThyOth_DxDateImputed)*/
	FU_ThyOth_Event	 	 	 	/*CALC: Other/unknown thyroid disease/condition (initial diagnosis) - Event*/

	/*FU_ThyOth_FLAGCancer	 	 	 	/*FLAG: Excluded post-thyroid cancer self report of other/unknown thyroid disease/condition*/
	/*FU_ThyOth_FLAGTimingImp	 	 	 	/*FLAG: Other/unknown thyroid disease/condition - Timing of diagnosis around baseline imputed*/
	/*FU_ThyProcOth	 	 	 	/*FLAG: Other thyroid surgery or procedure - Type of procedure (1=nodule/cyst surgically removed 2=other/unknown surgery 3=biopsy 4=cyst drained. Not systematically asked/volunteered by participant)*/
	/*/`
	*FU_ThyProcOth_Age	 	 	 	/*CALC: Other thyroid surgery or procedure - Age at procedure (.b=Prevalent, age unknown. Not systematically asked about/volunteered by participant)*/
	/*FU_ThyProcOth_AgeExact	 	 	 	/*CALC: Other thyroid surgery or procedure - Age (exact) at procedure (.b=Prevalent, age unknown. Not systematically asked about/volunteered by participant)*/
	FU_Thyroidectomy	 	 	 	/*FLAG: Thyroidectomy - Extent (1=partial 2=complete/no thyroid remaining 3=unknown amount. Not systematically asked/volunteered by participant)*/

	/*FU_Thyroidectomy_Age	 	 	 	/*CALC: Thyroidectomy - Age at procedure (.b=Prevalent, age unknown. Thyroidectomy not systematically asked about/volunteered by participant)*/
	FU_Thyroidectomy_AgeExact	 	 	 	/*CALC: Thyroidectomy - Age (exact) at procedure (.b=Prevalent, age unknown. Thyroidectomy not systematically asked about/volunteered by participant)*/

	/*Rx_ThyroidMed_AgeStart_T0	/*CALC: Age at first use of Thyroid Hormone Substitutes/Antithyroid/Iodine/Iodide through baseline*/
	/*Rx_ThyroidMed_AgeStop_T0	/*CALC: Age at last use of Thyroid Hormone Substitutes/Antithyroid/Iodine/Iodide through baseline*/	
	/*Rx_ThyroidMed_Current_T0	/*CALC: Currently use Thyroid Hormone Substitutes/Antithyroid/Iodine/Iodide at baseline*/	
	/*Rx_ThyroidMed_Dose_T0	/*CALC: Total Dose of Thyroid Hormone Substitutes/Antithyroid/Iodine/Iodide through baseline*/	
	Rx_ThyroidMed_Ever_T0	/*CALC: Ever used Thyroid Hormone Substitutes/Antithyroid/Iodine/Iodide through baseline*/	

	;
run;

data ss_illness_treatment;
	set ss_illness_treatment;

	if FU_DiabBordPr_DxPreBaseline=1 then
		illness_diab_border_bl = 1;
	else illness_diab_border_bl=0;

	if FU_Diab_DxPreBaseline=1 then
		illness_diab_bl = 1;
	else illness_diab_bl=0;

	if FU_ThyHyper_DxPreBaseline=1 then
		illness_hyper_bl = 1;
	else illness_hyper_bl=0;

	if FU_ThyHypo_DxPreBaseline=1 then
		illness_hypo_bl = 1;
	else illness_hypo_bl=0;

	if FU_ThyNod_DxPreBaseline=1 then
		illness_thynod_bl = 1;
	else illness_thynod_bl=0;

	if FU_ThyOth_DxPreBaseline=1 then
		illness_thyoth_bl = 1;
	else illness_thyoth_bl=0;

	if  max(of illness_hyper_bl  illness_hypo_bl illness_thynod_bl illness_thyoth_bl)=1 then
		illness_thyroid_disease = 1;
	else illness_thyroid_disease=0;
	format 
	illness_diab_border_bl illness_diab_bl  illness_hyper_bl illness_hypo_bl  illness_thynod_bl illness_thyoth_bl illness_thyroid_disease yesno.;
run;

data ss_illness_treatment;
	set ss_illness_treatment;

	if FU_Thyroidectomy=2 and FU_Thyroidectomy_Ageexact<=Age_Baseline then
		tre_thyroidectomy=1;
	else tre_thyroidectomy=0;

	if Rx_ThyroidMed_Ever_T0 = 1 then
		tre_thyr_med_all = 1;
	else tre_thyr_med_all = 0;
	format tre_thyroidectomy tre_thyr_med_all  yesno.;
run;

data ss_illness_treatment;
	set ss_illness_treatment;

	if  max(of illness_thyroid_disease  tre_thyr_med_all)=1 then
		illness_thyroid_all = 1;
	else illness_thyroid_all=0;
	format illness_thyroid_all yesno.;
run;

data ss_illness_treatment;
	set ss_illness_treatment;
	keep psid illness_diab_border_bl illness_diab_bl  illness_hyper_bl illness_hypo_bl  illness_thynod_bl illness_thyoth_bl illness_thyroid_all illness_thyroid_disease
		tre_thyroidectomy tre_thyr_med_all ;
run;

data ss_illness_treatment;
	set ss_illness_treatment;
	array change _numeric_;

	do over change;
		if change in (. .A, .B, .C, .D, .E, .F, .G, .H, .I, .J, .K, .L, .M, .N, .O, .P, .Q, .R, .S, .T, .U, .V, .W, .X, .Y, .Z ) then
			change=-1;
	end;
run;

/*data ss_illness_treatment;
set ss_illness_treatment;
array change 
;
       do over change;
           if change =-1 then change=.;
       end;
run;

/*
PROC CONTENTS DATA=ss_illness_treatment OUT=var_info NOPRINT;
RUN;
DATA variables_with_formats;
   SET var_info;
   WHERE format = '';
   KEEP name label;
RUN;
proc freq data=ss_illness_treatment;table _numeric_;run;*/
data ss.ss_illness_treatment;
	set ss_illness_treatment;
run;

proc datasets library=work nolist;
	delete ss_illness_treatment;
quit;
