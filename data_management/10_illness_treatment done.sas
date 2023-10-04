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

	/*HZ_RM_BRCA1	 	 	 	/*CALC: BRCA1 status (from best available source in baseline and follow-up)*/
	/*HZ_RM_BRCA2	 	 	 	/*CALC: BRCA2 status (from best available source in baseline and follow-up)*/
	/*HZ_RM_BRCA1_SOURCE	 	 	 	/*Source for HZ_RM_BRCA1 - MR (medical reports), FHU (Family Health Update), BCFU (breast cancer follow-up self-report) or PX (baseline CATI self-report)*/
	/*HZ_RM_BRCA2_SOURCE	 	 	 	/*Source for HZ_RM_BRCA2 - MR (medical reports), FHU (Family Health Update), BCFU (breast cancer follow-up self-report) or PX (baseline CATI self-report)*/
	/*HZ_RX_Amiodarone_AgeStart	 	 	 	/*CALC: Harmonized - Age at first use of amiodarone*/
	/*HZ_RX_Amiodarone_AgeStop	 	 	 	/*CALC: Harmonized - Age at last use of amiodarone*/
	/*HZ_RX_Amiodarone_Current	 	 	 	/*CALC: Harmonized - Currently use amiodarone*/
	/*HZ_RX_Amiodarone_Dose	 	 	 	/*CALC: Harmonized - Total dose of amiodarone - (times/day)*(days/week) summed over years of use*/
	/*HZ_RX_Amiodarone_Ever	 	 	 	/*CALC: Harmonized - Ever used amiodarone*/
	/*HZ_RX_Amiodarone_FqMiss	 	 	 	/*FLAG: Harmonized - Frequency missing for at least one reported medication within class*/
	/*HZ_RX_Amiodarone_Freq	 	 	 	/*CALC: Harmonized - Average frequency used amiodarone  (times/week) (See HZ_RX_Amiodarone_FqMiss)*/
	/*HZ_RX_Amiodarone_Years	 	 	 	/*CALC: Harmonized - Total years used amiodarone (See HZ_RX_Amiodarone_YrMiss)*/
	/*HZ_RX_Amiodarone_YrMiss	 	 	 	/*FLAG: Harmonized - Duration missing for at least one reported medication within class*/
	HZ_RX_Antithyroid_AgeStart	 	 	 	/*CALC: Harmonized - Age at first use of antithyroid medication*/

	/*HZ_RX_Antithyroid_AgeStop	 	 	 	/*CALC: Harmonized - Age at last use of antithyroid medication*/
	/*HZ_RX_Antithyroid_Current	 	 	 	/*CALC: Harmonized - Currently use antithyroid medication*/
	/*HZ_RX_Antithyroid_Dose	 	 	 	/*CALC: Harmonized - Total dose of antithyroid medication - (times/day)*(days/week) summed over years of use*/
	HZ_RX_Antithyroid_Ever	 	 	 	/*CALC: Harmonized - Ever used antithyroid medication*/

	/*HZ_RX_Antithyroid_FqMiss	 	 	 	/*FLAG: Harmonized - Frequency missing for at least one reported medication within class*/
	/*HZ_RX_Antithyroid_Freq	 	 	 	/*CALC: Harmonized - Average frequency used antithyroid medication  (times/week) (See HZ_RX_Antithyroid_FqMiss)*/
	/*HZ_RX_Antithyroid_Years	 	 	 	/*CALC: Harmonized - Total years used antithyroid medication (See HZ_RX_Antithyroid_YrMiss)*/

	/*HZ_RX_Antithyroid_YrMiss	 	;
	/*HZ_RX_BiologicalProds_AgeStart	 	 	 	/*CALC: Harmonized - Age at first use of biological products*/

	/*HZ_RX_BiologicalProds_AgeStop	 	 	 	/*CALC: Harmonized - Age at last use of biological products*/
	/*HZ_RX_BiologicalProds_Current	 	 	 	/*CALC: Harmonized - Currently use biological products*/
	/*HZ_RX_BiologicalProds_Dose	 	 	 	/*CALC: Harmonized - Total dose of biological products - (times/day)*(days/week) summed over years of use*/
	/*HZ_RX_BiologicalProds_Ever	 	 	 	/*CALC: Harmonized - Ever used biological products*/
	/*HZ_RX_BiologicalProds_FqMiss	 	 	 	/*FLAG: Harmonized - Frequency missing for at least one reported medication within class*/
	/*HZ_RX_BiologicalProds_Freq	 	 	 	/*CALC: Harmonized - Average frequency used biological products  (times/week) (See HZ_RX_BiologicalProds_FqMiss)*/
	/*HZ_RX_BiologicalProds_Years	 	 	 	/*CALC: Harmonized - Total years used biological products (See HZ_RX_BiologicalProds_YrMiss)*/
	/*HZ_RX_BiologicalProds_YrMiss	 	 	 	/*FLAG: Harmonized - Duration missing for at least one reported medication within class*/
	HZ_RX_Diab_AnyOralMed_AgeStart	 	 	 	/*CALC: Harmonized - Age at first use of any oral diabetes medication*/

	/*HZ_RX_Diab_AnyOralMed_AgeStop	 	 	 	/*CALC: Harmonized - Age at last use of any oral diabetes medication*/
	/*HZ_RX_Diab_AnyOralMed_Current	 	 	 	/*CALC: Harmonized - Currently use any oral diabetes medication*/
	/*HZ_RX_Diab_AnyOralMed_Dose	 	 	 	/*CALC: Harmonized - Total dose of any oral diabetes medication - (times/day)*(days/week) summed over years of use*/
	HZ_RX_Diab_AnyOralMed_Ever	 	 	 	/*CALC: Harmonized - Ever used any oral diabetes medication*/

	/*HZ_RX_Diab_AnyOralMed_FqMiss	 	 	 	/*FLAG: Harmonized - Frequency missing for at least one reported medication within class*/
	/*HZ_RX_Diab_AnyOralMed_Freq	 	 	 	/*CALC: Harmonized - Average frequency used any oral diabetes medication (times/week) (See HZ_RX_Diab_AnyOralMed_FqMiss)*/
	/*HZ_RX_Diab_AnyOralMed_Years	 	 	 	/*CALC: Harmonized - Total years used any oral diabetes medication (See HZ_RX_Diab_AnyOralMed_YrMiss)*/
	/*HZ_RX_Diab_AnyOralMed_YrMiss	 	 	 	/*FLAG: Harmonized - Duration missing for at least one reported medication within class*/
	HZ_RX_Diab_Insulin_AgeStart	 	 	 	/*CALC: Harmonized - Age at first use of insulin*/

	/*HZ_RX_Diab_Insulin_AgeStop	 	 	 	/*CALC: Harmonized - Age at last use of insulin*/
	/*HZ_RX_Diab_Insulin_Current	 	 	 	/*CALC: Harmonized - Currently use insulin*/
	/*HZ_RX_Diab_Insulin_Dose	 	 	 	/*CALC: Harmonized - Total dose of insulin - (times/day)*(days/week) summed over years of use*/
	HZ_RX_Diab_Insulin_Ever	 	 	 	/*CALC: Harmonized - Ever used insulin*/

	/*HZ_RX_Diab_Insulin_FqMiss	 	 	 	/*FLAG: Harmonized - Frequency missing for at least one reported medication within class*/
	/*HZ_RX_Diab_Insulin_Freq	 	 	 	/*CALC: Harmonized - Average frequency used insulin (times/week) (See HZ_RX_Diab_insulin_FqMiss)*/
	/*HZ_RX_Diab_Insulin_Years	 	 	 	/*CALC: Harmonized - Total years used insulin (See HZ_RX_Diab_Insulin_YrMiss)*/
	/*HZ_RX_Diab_Insulin_YrMiss	 	 	 	/*FLAG: Harmonized - Duration missing for at least one reported medication within class*/
	/*HZ_RX_HTN_Any_AgeStart	 	 	 	/*CALC: Harmonized - Age at first use of any hypertension medication*/
	/*HZ_RX_HTN_Any_AgeStop	 	 	 	/*CALC: Harmonized - Age at last use of any hypertension medication*/
	/*HZ_RX_HTN_Any_Current	 	 	 	/*CALC: Harmonized - Currently use any hypertension medication*/
	/*HZ_RX_HTN_Any_Dose	 	 	 	/*CALC: Harmonized - Total dose of any hypertension medication - (times/day)*(days/week) summed over years of use*/
	/*HZ_RX_HTN_Any_Ever	 	 	 	/*CALC: Harmonized - Ever used any hypertension medication*/
	/*HZ_RX_HTN_Any_FqMiss	 	 	 	/*FLAG: Harmonized - Frequency missing for at least one reported medication within class*/
	/*HZ_RX_HTN_Any_Freq	 	 	 	/*CALC: Harmonized - Average frequency used any hypertension medication (times/week) (See HZ_RX_HTN_Any_FqMiss)*/
	/*HZ_RX_HTN_Any_Years	 	 	 	/*CALC: Harmonized - Total years used any hypertension medication (See HZ_RX_HTN_Any_YrMiss)*/
	/*HZ_RX_HTN_Any_YrMiss	 	 	 	/*FLAG: Harmonized - Duration missing for at least one reported medication within class*/
	/*HZ_RX_Interferon_AgeStart	 	 	 	/*CALC: Harmonized - Age at first use of interferon*/
	/*HZ_RX_Interferon_AgeStop	 	 	 	/*CALC: Harmonized - Age at last use of interferon*/
	/*HZ_RX_Interferon_Current	 	 	 	/*CALC: Harmonized - Currently use interferon*/
	/*HZ_RX_Interferon_Dose	 	 	 	/*CALC: Harmonized - Total dose of interferon - (times/day)*(days/week) summed over years of use*/
	/*HZ_RX_Interferon_Ever	 	 	 	/*CALC: Harmonized - Ever used interferon*/
	/*HZ_RX_Interferon_FqMiss	 	 	 	/*FLAG: Harmonized - Frequency missing for at least one reported medication within class*/
	/*HZ_RX_Interferon_Freq	 	 	 	/*CALC: Harmonized - Average frequency used interferon  (times/week) (See HZ_RX_Interferon_FqMiss)*/
	/*HZ_RX_Interferon_Years	 	 	 	/*CALC: Harmonized - Total years used interferon (See HZ_RX_Interferon_YrMiss)*/
	/*HZ_RX_Interferon_YrMiss	 	 	 	/*FLAG: Harmonized - Duration missing for at least one reported medication within class*/
	/*HZ_RX_Lithium_AgeStart	 	 	 	/*CALC: Harmonized - Age at first use of lithium*/
	/*HZ_RX_Lithium_AgeStop	 	 	 	/*CALC: Harmonized - Age at last use of lithium*/
	/*HZ_RX_Lithium_Current	 	 	 	/*CALC: Harmonized - Currently use lithium*/
	/*HZ_RX_Lithium_Dose	 	 	 	/*CALC: Harmonized - Total dose of lithium - (times/day)*(days/week) summed over years of use*/
	/*HZ_RX_Lithium_Ever	 	 	 	/*CALC: Harmonized - Ever used lithium*/
	/*HZ_RX_Lithium_FqMiss	 	 	 	/*FLAG: Harmonized - Frequency missing for at least one reported medication within class*/
	/*HZ_RX_Lithium_Freq	 	 	 	/*CALC: Harmonized - Average frequency used lithium  (times/week) (See HZ_RX_Lithium_FqMiss)*/
	/*HZ_RX_Lithium_Years	 	 	 	/*CALC: Harmonized - Total years used lithium (See HZ_RX_Lithium_YrMiss)*/
	/*HZ_RX_Lithium_YrMiss	 	 	 	/*FLAG: Harmonized - Duration missing for at least one reported medication within class*/
	/*HZ_RX_Meds_FUSource	 	 	 	/*CALC: Source of medication history through follow-up (1=Baseline only, 2=Baseline & Follow-up, 3=Follow-up only)*/
	/*HZ_RX_Meds_FUSource_Age	 	 	 	/*CALC: Exact age through which medication history extends [MDDate, H_Date, TH_Date, LH_Date, TT_Date]*/
	/*HZ_RX_Meds_FUSource_AgeExact	 	 	 	/*CALC: Age through which medication history extends [MDDate, H_Date, TH_Date, LH_Date, TT_Date]*/
	HZ_RX_OtherIodineMeds_AgeStart	 	 	 	/*CALC: Harmonized - Age at first use of other iodine medication*/

	/*HZ_RX_OtherIodineMeds_AgeStop	 	 	 	/*CALC: Harmonized - Age at last use of other iodine medication*/
	/*HZ_RX_OtherIodineMeds_Current	 	 	 	/*CALC: Harmonized - Currently use other iodine medication*/
	/*HZ_RX_OtherIodineMeds_Dose	 	 	 	/*CALC: Harmonized - Total dose of other iodine medication - (times/day)*(days/week) summed over years of use*/
	HZ_RX_OtherIodineMeds_Ever	 	 	 	/*CALC: Harmonized - Ever used other iodine medication*/

	/*HZ_RX_OtherIodineMeds_FqMiss	 	 	 	/*FLAG: Harmonized - Frequency missing for at least one reported medication within class*/
	/*HZ_RX_OtherIodineMeds_Freq	 	 	 	/*CALC: Harmonized - Average frequency used other iodine medication  (times/week) (See HZ_RX_OtherIodineMeds_FqMiss)*/
	/*HZ_RX_OtherIodineMeds_Years	 	 	 	/*CALC: Harmonized - Total years used other iodine medication (See HZ_RX_OtherIodineMeds_YrMiss)*/
	/*HZ_RX_OtherIodineMeds_YrMiss	 	 	 	/*FLAG: Harmonized - Duration missing for at least one reported medication within class*/
	HZ_RX_Pot_Sod_Iodide_AgeStart	 	 	 	/*CALC: Harmonized - Age at first use of potassium or sodium iodide*/

	/*HZ_RX_Pot_Sod_Iodide_AgeStop	 	 	 	/*CALC: Harmonized - Age at last use of potassium or sodium iodide*/
	/*HZ_RX_Pot_Sod_Iodide_Current	 	 	 	/*CALC: Harmonized - Currently use potassium or sodium iodide*/
	/*HZ_RX_Pot_Sod_Iodide_Dose	 	 	 	/*CALC: Harmonized - Total dose of potassium or sodium iodide - (times/day)*(days/week) summed over years of use*/
	HZ_RX_Pot_Sod_Iodide_Ever	 	 	 	/*CALC: Harmonized - Ever used potassium or sodium iodide*/

	/*HZ_RX_Pot_Sod_Iodide_FqMiss	 	 	 	/*FLAG: Harmonized - Frequency missing for at least one reported medication within class*/
	/*HZ_RX_Pot_Sod_Iodide_Freq	 	 	 	/*CALC: Harmonized - Average frequency used potassium or sodium iodide  (times/week) (See HZ_RX_Pot_Sod_Iodide_FqMiss)*/
	/*HZ_RX_Pot_Sod_Iodide_Years	 	 	 	/*CALC: Harmonized - Total years used potassium or sodium iodide (See HZ_RX_Pot_Sod_Iodide_YrMiss)*/
	/*HZ_RX_Pot_Sod_Iodide_YrMiss	 	 	 	/*FLAG: Harmonized - Duration missing for at least one reported medication within class*/
	HZ_RX_ThyroidHormSub_AgeStart	 	 	 	/*CALC: Harmonized - Age at first use of thyroid hormone substitutes*/

	/*HZ_RX_ThyroidHormSub_AgeStop	 	 	 	/*CALC: Harmonized - Age at last use of thyroid hormone substitutes*/
	/*HZ_RX_ThyroidHormSub_Current	 	 	 	/*CALC: Harmonized - Currently use thyroid hormone substitutes*/
	/*HZ_RX_ThyroidHormSub_Dose	 	 	 	/*CALC: Harmonized - Total dose of thyroid hormone substitutes - (times/day)*(days/week) summed over years of use*/
	HZ_RX_ThyroidHormSub_Ever	 	 	 	/*CALC: Harmonized - Ever used thyroid hormone substitutes*/

	/*HZ_RX_ThyroidHormSub_FqMiss	 	 	 	/*FLAG: Harmonized - Frequency missing for at least one reported medication within class*/
	/*HZ_RX_ThyroidHormSub_Freq	 	 	 	/*CALC: Harmonized - Average frequency used thyroid hormone substitutes  (times/week) (See HZ_RX_ThyroidHormSub_FqMiss)*/
	/*HZ_RX_ThyroidHormSub_Years	 	 	 	/*CALC: Harmonized - Total years used thyroid hormone substitutes (See HZ_RX_ThyroidHormSub_YrMiss)*/
	/*HZ_RX_ThyroidHormSub_YrMiss	 	 	 	/*FLAG: Harmonized - Duration missing for at least one reported medication within class*/
	HZ_RX_ThyroidMed_AgeStart	 	 	 	/*CALC: Harmonized - Age at first use of thyroid hormone substitutes, antithyroid, or iodine/iodide medication*/

	/*HZ_RX_ThyroidMed_AgeStop	 	 	 	/*CALC: Harmonized - Age at last use of thyroid hormone substitutes, antithyroid, or iodine/iodide medication*/
	/*HZ_RX_ThyroidMed_Current	 	 	 	/*CALC: Harmonized - Currently use thyroid hormone substitutes, antithyroid, or iodine/iodide medication*/
	/*HZ_RX_ThyroidMed_Dose	 	 	 	/*CALC: Harmonized - Total dose of thyroid hormone substitutes, antithyroid, or iodine/iodide medication - (times/day)*(days/week) summed over years of use*/
	HZ_RX_ThyroidMed_Ever	 	 	 	/*CALC: Harmonized - Ever used thyroid hormone substitutes, antithyroid, or iodine/iodide medication*/

	/*HZ_RX_ThyroidMed_FqMiss	 	 	 	/*FLAG: Harmonized - Frequency missing for at least one reported medication within class*/
	/*HZ_RX_ThyroidMed_Freq	 	 	 	/*CALC: Harmonized - Average frequency used thyroid hormone substitutes, antithyroid, or iodine/iodide medication  (times/week) (See HZ_RX_ThyroidMed_FqMiss)*/
	/*HZ_RX_ThyroidMed_Years	 	 	 	/*CALC: Harmonized - Total years used thyroid hormone substitutes, antithyroid, or iodine/iodide medication (See HZ_RX_ThyroidMed_YrMiss)*/
	/*HZ_RX_ThyroidMed_YrMiss	 	 	 	/*FLAG: Harmonized - Duration missing for at least one reported medication within class*/
	HZ_RX_Thyrotrophin_AgeStart	 	 	 	/*CALC: Harmonized - Age at first use of thyrotrophin*/

	/*HZ_RX_Thyrotrophin_AgeStop	 	 	 	/*CALC: Harmonized - Age at last use of thyrotrophin*/
	/*HZ_RX_Thyrotrophin_Current	 	 	 	/*CALC: Harmonized - Currently use thyrotrophin*/
	/*HZ_RX_Thyrotrophin_Dose	 	 	 	/*CALC: Harmonized - Total dose of thyrotrophin - (times/day)*(days/week) summed over years of use*/
	HZ_RX_Thyrotrophin_Ever	 	 	 	/*CALC: Harmonized - Ever used thyrotrophin*/

	/*HZ_RX_Thyrotrophin_FqMiss	 	 	 	/*FLAG: Harmonized - Frequency missing for at least one reported medication within class*/
	/*HZ_RX_Thyrotrophin_Freq	 	 	 	/*CALC: Harmonized - Average frequency used thyrotrophin  (times/week) (See HZ_RX_Thyrotrophin_FqMiss)*/
	/*HZ_RX_Thyrotrophin_Years	 	 	 	/*CALC: Harmonized - Total years used thyrotrophin (See HZ_RX_Thyrotrophin_YrMiss)*/
	/*HZ_RX_Thyrotrophin_YrMiss	 	 	 	/*FLAG: Harmonized - Duration missing for at least one reported medication within class*/
	/*HR_HYST_FLAG_LOCF_T1	 	 	 	/*FLAG: Subject missing Hysterectomy status at 1st detailed follow-up, status based on last known*/
	/*HR_HYST_FLAG_LOCF_T2	 	 	 	/*FLAG: Subject missing Hysterectomy status at 2nd detailed follow-up, status based on last known*/
	/*HR_HYST_FLAG_LOCF_T3	 	 	 	/*FLAG: Subject missing Hysterectomy status at 3rd detailed follow-up, status based on last known*/
	/*HR_HYST_FLAG_LOCF_T4	 	 	 	/*FLAG: Subject missing Hysterectomy status at 4th detailed follow-up, status based on last known*/
	/*HR_HystAgeExact_T1	 	 	 	/*CALC: HR_HystAgeExact_T1. Hysterectomy age to the 1/10th of a year updated through 1st detailed follow-up*/
	/*HR_HystAgeExact_T2	 	 	 	/*CALC: HR_HystAgeExact_T2. Hysterectomy age to the 1/10th of a year updated through 2nd detailed follow-up*/
	/*HR_HystAgeExact_T3	 	 	 	/*CALC: HR_HystAgeExact_T3. Hysterectomy age to the 1/10th of a year updated through 3rd detailed follow-up*/
	/*HR_HystAgeExact_T4	 	 	 	/*CALC: HR_HystAgeExact_T4. Hysterectomy age to the 1/10th of a year updated through 4th detailed follow-up*/
	/*HR_HystAge_T1	 	 	 	/*CALC: HR_HystAge_T1. Hysterectomy age updated through 1st detailed follow-up*/
	/*HR_HystAge_T2	 	 	 	/*CALC: HR_HystAge_T2. Hysterectomy age updated through 2nd detailed follow-up*/
	/*HR_HystAge_T3	 	 	 	/*CALC: HR_HystAge_T3. Hysterectomy age updated through 3rd detailed follow-up*/
	/*HR_HystAge_T4	 	 	 	/*CALC: HR_HystAge_T4. Hysterectomy age updated through 4th detailed follow-up*/
	/*HR_Hyst_T1	 	 	 	/*CALC: HR_Hyst_T1. Hysterectomy updated through 1st detailed follow-up*/
	/*HR_Hyst_T2	 	 	 	/*CALC: HR_Hyst_T2. Hysterectomy updated through 2nd detailed follow-up*/
	/*HR_Hyst_T3	 	 	 	/*CALC: HR_Hyst_T3. Hysterectomy updated through 3rd detailed follow-up*/
	/*HR_Hyst_T4	 	 	 	/*CALC: HR_Hyst_T4. Hysterectomy updated through 4th detailed follow-up*/
	/*BH_RX_Amiodarone_Current	 	 	 	/*CALC: 1st detailed follow-up - Currently use amiodarone [H176]*/
	/*BH_RX_Antithyroid_Current	 	 	 	/*CALC: 1st detailed follow-up - Currently use antithyroid meds [H176]*/
	/*BH_RX_BiologicalProds_Current	 	 	 	/*CALC: 1st detailed follow-up - Currently use biological products [H176]*/
	/*BH_RX_Diab_AnyOralMed_Current	 	 	 	/*CALC: 1st Detailed follow-up - Currently use any oral diabetes meds [H176]*/
	/*BH_RX_Diab_Insulin_Current	 	 	 	/*CALC: 1st Detailed follow-up - Currently use insulin [H37C, H176]*/
	/*BH_RX_HTN_Any_Current	 	 	 	/*CALC: 1st detailed follow-up - Currently use any hypertension medication [H176]*/
	/*BH_RX_Interferon_Current	 	 	 	/*CALC: 1st detailed follow-up - Currently use interferon [H176]*/
	/*BH_RX_Lithium_Current	 	 	 	/*CALC: 1st detailed follow-up - Currently use lithium [H176]*/
	/*BH_RX_Meds_Missing	 	 	 	/*CALC: 1st detailed Follow-Up - missing form or reported medications*/
	/*BH_RX_OtherIodineMeds_Current	 	 	 	/*CALC: 1st detailed follow-up - Currently use other iodine meds [H176]*/
	/*BH_RX_Pot_Sod_Iodide_Current	 	 	 	/*CALC: 1st detailed follow-up - Currently use potassium or sodium iodide [H176]*/
	/*BH_RX_ThyroidHormSub_Current	 	 	 	/*CALC: 1st detailed follow-up - Currently use thyroid hormone substitutes [H176]*/
	/*BH_RX_ThyroidMed_Current	 	 	 	/*CALC: 1st detailed follow-up - Currently use thyroid hormone substitutes, antithyroid, or iodine/iodide meds [H176]*/
	/*BH_RX_Thyrotrophin_Current	 	 	 	/*CALC: 1st detailed follow-up - Currently use thyrotrophin [H176]*/
	/*MC149	 	 	 	/*MC149. Ever had radiation treatment*/
	/*MC150	 	 	 	/*MC150. Radiation for spondylitis*/
	/*MC151	 	 	 	/*MC151. Age 1st had radiation for spondylitis*/
	/*MC152	 	 	 	/*MC152. Total # rad treatments for spondylitis*/
	/*MC153	 	 	 	/*MC153. Radiation type for spondylitis*/
	/*MC154	 	 	 	/*MC154. Radiation for bursitis/arthritis*/
	/*MC155	 	 	 	/*MC155. Age 1st had radiation for bursitis/arthritis*/
	/*MC156	 	 	 	/*MC156. Total # rad treatments for bursitis/arthritis*/
	/*MC157	 	 	 	/*MC157. Radiation type for bursitis/arthritis*/
	/*MC158	 	 	 	/*MC158. Radiation for skin conditions*/
	/*MC159	 	 	 	/*MC159. Age 1st had radiation for skin conditions*/
	/*MC160	 	 	 	/*MC160. Total # rad treatments for skin conditions*/
	/*MC161	 	 	 	/*MC161. Radiation type for skin conditions*/
	/*MC162	 	 	 	/*MC162. Radiation for enlarged tonsils/adenoids*/
	/*MC163	 	 	 	/*MC163. Age 1st had radiation for tonsils/adenoids*/
	/*MC164	 	 	 	/*MC164. Total # rad treatments for tonsils/adenoids*/
	/*MC165	 	 	 	/*MC165. Radiation type for tonsils/adenoids*/
	/*MC166	 	 	 	/*MC166. Radiation for enlarged thymus gland*/
	/*MC167	 	 	 	/*MC167. Total # rad treatments for enlarged thymus gland*/
	/*MC168	 	 	 	/*MC168. Radiation type for enlarged thymus gland*/
	/*MC169	 	 	 	/*MC169. Radiation for other condition*/
	/*MC170	 	 	 	/*MC170. Age 1st had radiation for other conditions*/
	/*MC171	 	 	 	/*MC171. Total # rad treatments for other conditions*/
	/*MC172	 	 	 	/*MC172. Radiation type for other conditions*/
	/*MC169sp	 	 	 	/*MC169. Specify other condition treated w/radiation*/
	/*TT57_1	 	 	 	/*TT57. Thyroid - ever take levothyroxine*/
	/*TT57_2	 	 	 	/*TT57. Thyroid - ever take propylthiouracil/PTU*/
	/*TT57_3	 	 	 	/*TT57. Thyroid - ever take methimazole/MMI*/
	/*TT57_4	 	 	 	/*TT57. Thyroid - ever take other prescription medication*/
	/*TT57a_1	 	 	 	/*TT57. Thyroid - currently take levothyroxine*/
	/*TT57a_2	 	 	 	/*TT57. Thyroid - currently take propylthiouracil/PTU*/
	/*TT57a_3	 	 	 	/*TT57. Thyroid - currently take methimazole/MMI*/
	/*TT57a_4	 	 	 	/*TT57. Thyroid - currently take other prescription medication*/
	/*TT57dSp	 	 	 	/*TT57.  Thyroid - currently take other prescription medication - specify*/
	/*TT59a	 	 	 	/*TT59. Thyroid problems stopped after stopping medications such as lithium or amiodarone*/
	/*TT_RX_Amiodarone_Current	 	 	 	/*CALC: 4th detailed follow-up - Currently use amiodarone [TT147]*/
	/*TT_RX_Antithyroid_Current	 	 	 	/*CALC: 4th detailed follow-up - Currently use antithyroid meds [TT147]*/
	/*TT_RX_BiologicalProds_Current	 	 	 	/*CALC: 4th detailed follow-up - Currently use biological products [TT147]*/
	/*TT_RX_Diab_AnyOralMed_Current	 	 	 	/*CALC: 4th Detailed follow-up - Currently use any oral diabetes meds [TT147]*/
	/*TT_RX_Diab_Insulin_Current	 	 	 	/*CALC: 4th Detailed follow-up - Currently use insulin [TT39, TT147]*/
	/*TT_RX_HTN_Any_Current	 	 	 	/*CALC: 4th detailed follow-up - Currently use any hypertension medication [TT147]*/
	/*TT_RX_Interferon_Current	 	 	 	/*CALC: 4th detailed follow-up - Currently use interferon [TT147]*/
	/*TT_RX_Lithium_Current	 	 	 	/*CALC: 4th detailed follow-up - Currently use lithium [TT147]*/
	/*TT_RX_Meds_Missing	 	 	 	/*CALC: 4th detailed Follow-Up - missing form or reported medications*/
	/*TT_RX_OtherIodineMeds_Current	 	 	 	/*CALC: 4th detailed follow-up - Currently use other iodine meds [TT147]*/
	/*TT_RX_Pot_Sod_Iodide_Current	 	 	 	/*CALC: 4th detailed follow-up - Currently use potassium or sodium iodide [TT147]*/
	/*TT_RX_ThyroidHormSub_Current	 	 	 	/*CALC: 4th detailed follow-up - Currently use thyroid hormone substitutes [TT147]*/
	/*TT_RX_ThyroidMed_Current	 	 	 	/*CALC: 4th detailed follow-up - Currently use thyroid hormone substitutes, antithyroid, or iodine/iodide meds [TT147]*/
	/*TT_RX_Thyrotrophin_Current	 	 	 	/*CALC: 4th detailed follow-up - Currently use thyrotrophin [TT147]*/
	/*TH_RX_Amiodarone_Current	 	 	 	/*CALC: 2nd detailed follow-up - Currently use amiodarone [TH199]*/
	/*TH_RX_Antithyroid_Current	 	 	 	/*CALC: 2nd detailed follow-up - Currently use antithyroid meds [TH199]*/
	/*TH_RX_BiologicalProds_Current	 	 	 	/*CALC: 2nd detailed follow-up - Currently use biological products [TH199]*/
	/*TH_RX_Diab_AnyOralMed_Current	 	 	 	/*CALC: 2nd Detailed follow-up - Currently use any oral diabetes meds [TH199]*/
	/*TH_RX_Diab_Insulin_Current	 	 	 	/*CALC: 2nd Detailed follow-up - Currently use insulin [TH47C, TH199]*/
	/*TH_RX_HTN_Any_Current	 	 	 	/*CALC: 2nd detailed follow-up - Currently use any hypertension medication [TH199]*/
	/*TH_RX_Interferon_Current	 	 	 	/*CALC: 2nd detailed follow-up - Currently use interferon [TH199]*/
	/*TH_RX_Lithium_Current	 	 	 	/*CALC: 2nd detailed follow-up - Currently use lithium [TH199]*/
	/*TH_RX_Meds_Missing	 	 	 	/*CALC: 2nd detailed Follow-Up - missing form or reported medications*/
	/*TH_RX_OtherIodineMeds_Current	 	 	 	/*CALC: 2nd detailed follow-up - Currently use other iodine meds [TH199]*/
	/*TH_RX_Pot_Sod_Iodide_Current	 	 	 	/*CALC: 2nd detailed follow-up - Currently use potassium or sodium iodide [TH199]*/
	/*TH_RX_ThyroidHormSub_Current	 	 	 	/*CALC: 2nd detailed follow-up - Currently use thyroid hormone substitutes [TH199]*/
	/*TH_RX_ThyroidMed_Current	 	 	 	/*CALC: 2nd detailed follow-up - Currently use thyroid hormone substitutes, antithyroid, or iodine/iodide meds [TH199]*/
	/*TH_RX_Thyrotrophin_Current	 	 	 	/*CALC: 2nd detailed follow-up - Currently use thyrotrophin [TH199]*/
	/*PX_Chemo	 	 	 	/*CALC: PX6. Ever chemotherapy (yes/no) [PX6 repeating]*/
	/*PX_Radiation	 	 	 	/*CALC: PX7. Ever radiation therapy (yes/no) [PX7 repeating]*/
	/*REX1_AgeExact	 	 	 	/*CALC: Age (exact) at questionnaire completion [(REX1_Date - DOB)/365.25]*/
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

	if HZ_RX_Antithyroid_Ever = 1 and HZ_RX_Antithyroid_AgeStart<=Age_Baseline then
		tre_antithyroid = 1;
	else tre_antithyroid = 0;

	if HZ_RX_Diab_AnyOralMed_Ever = 1 and HZ_RX_Diab_AnyOralMed_AgeStart<=Age_Baseline then
		tre_diab_oral = 1;
	else tre_diab_oral = 0;

	if HZ_RX_Diab_Insulin_Ever = 1 and HZ_RX_Diab_Insulin_AgeStart<=Age_Baseline then
		tre_insulin = 1;
	else tre_insulin = 0;

	if HZ_RX_Pot_Sod_Iodide_Ever = 1 and HZ_RX_Pot_Sod_Iodide_AgeStart<=Age_Baseline then
		tre_pot_sod_iodine = 1;
	else tre_pot_sod_iodine = 0;

	if HZ_RX_OtherIodineMeds_Ever = 1 and HZ_RX_OtherIodineMeds_AgeStart<=Age_Baseline then
		tre_other_iodine = 1;
	else tre_other_iodine = 0;

	if HZ_RX_ThyroidHormSub_Ever = 1 and HZ_RX_ThyroidHormSub_AgeStart<=Age_Baseline then
		tre_thyr_hor_sub = 1;
	else tre_thyr_hor_sub = 0;

	if HZ_RX_ThyroidMed_Ever = 1 and HZ_RX_ThyroidMed_AgeStart<=Age_Baseline then
		tre_thyr_med_all = 1;
	else tre_thyr_med_all = 0;

	if HZ_RX_Thyrotrophin_Ever = 1 and HZ_RX_Thyrotrophin_AgeStart<=Age_Baseline then
		tre_thyrotropin = 1;
	else tre_thyrotropin = 0;
	format tre_thyroidectomy tre_antithyroid tre_diab_oral tre_insulin  tre_pot_sod_iodine tre_other_iodine tre_thyr_hor_sub tre_thyr_med_all tre_thyrotropin  yesno.;
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
		tre_thyroidectomy tre_antithyroid tre_diab_oral tre_insulin  tre_pot_sod_iodine tre_other_iodine tre_thyr_hor_sub tre_thyr_med_all tre_thyrotropin;
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
