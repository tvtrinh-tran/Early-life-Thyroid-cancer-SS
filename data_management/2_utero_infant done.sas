data ss_utero_infant;
	set original;
	keep
	psid
	F4	 	 	 	/*CALC: F4. (recoded) Before pregnant with you, did mother have diabetes?*/
	F5	 	 	 	/*CALC: F5. (recoded) Before pregnant with you, did mother have epilepsy or seizure disorder?*/
	F6	 	 	 	/*CALC: F6. (recoded) When pregnant with you, did mother have preg-related high blood pressure?*/
	F7	 	 	 	/*CALC: F7. (recoded) When pregnant with you, did mother have pregnancy-related diabetes?*/
	F8	 	 	 	/*CALC: F8. (recoded) When pregnant with you, did mother have pre-eclampsia/eclampsia/toxemia?*/
	F9	 	 	 	/*CALC: F9. (recoded) When pregnant with you, did mother have morning sickness with vomiting?*/
	F10	 	 	 	/*CALC: F10. (recoded) When pregnant with you, did mother take DES (diethylstilbestrol)?*/
	F11	 	 	 	/*CALC: F11. (recoded) When pregnant with you, did your mother live on a farm?*/
	F12	 	 	 	/*CALC: F12. (recoded) Did your mother do any farm work while she was pregnant with you?*/
	F13	 	 	 	/*CALC: F13. (recoded) When pregnant with you, did your mother ever smoke cigarettes?*/
	F14	 	 	 	/*CALC: F14. (recoded) Biol. father smoke cigarettes during 3 months before mother preg. w/ you?*/
	F15	 	 	 	/*CALC: F15. (recoded) Did anyone in household smoke cigs at home when preg w/you (excl. mother)?*/

	/*F18	 	 	 	/*F18. Were you born within/before/after one week of mother's due date?*/
	/*F19	 	 	 	/*F19. If born early or late, how many weeks or months before/after due date?*/
	F21	 	 	 	/*F21. If you don't know your birth weight, was it < or > 5 pounds?*/
	F22	 	 	 	/*CALC: F22. (recoded) Were you ever breastfed as an infant?*/
	F24	 	 	 	/*CALC: F24. (recoded) Were you fed formulas made from soy (not regular formula)?*/

	/*F34	 	 	 	/*F34. If you don't know twin's birth weight, was it < or > 5 pounds?*/
	F16Age_v1	 	 	 	/*CALC: F16. Father's age when participant born (preference given to F17 midpoint over alive/died ages)*/

	/*F16Age_v2	 	 	 	/*CALC: F16. Father's age when participant born (preference given to alive/died over F17 midpoint)*/
	/*F16flag_v1	 	 	 	/*FLAG: F16Age imputed using: 1=midpoint from F17 2=FH_DadAliveAge, FHDate, DOB 3=FH_DadDiedYear, FH_DadDiedAge*/
	/*F16flag_v2	 	 	 	/*FLAG: F16Age imputed using: 1=midpoint from F17 2=FH_DadAliveAge, FHDate, DOB 3=FH_DadDiedYear, FH_DadDiedAge*/
	F174b	 	 	 	/*F174. [main only] Biological parents: diabetes?*/
	F20Weight	 	 	 	/*CALC: F20. Your Birth Weight [F20pound,F20ounce,F20DK]*/
	F20WeightCat	 	 	 	/*CALC: F20. Your Birth Weight [11 categories: F20pound,F20ounce,F20DK,F21]*/
	F20flag	 	 	 	/*FLAG: F20. Birth weight pounds given but ounces missing, don't know, or pounds/ounces out of range*/
	F27fix	 	 	 	/*F27fix. Were you a single birth, or one of a multiple birth (include stillbirths)? 1=single 2=multiple 3=possible multiple*/
	F28fix	 	 	 	/*F28fix. How many babies were delivered (including stillbirths)?*/
	F29fix	 	 	 	/*F29fix. Is twin sibling male or female?*/
	F2Age_v1	 	 	 	/*CALC: F2. Mother's age when participant born (preference given to F3 midpoint over alive/died ages)*/

	/*F2Age_v2	 	 	 	/*CALC: F2. Mother's age when participant born (preference given to alive/died over F3 midpoint)*/
	/*F2flag_v1	 	 	 	/*FLAG: F2Age imputed using: 1=midpoint from F3 2=FH_MomAliveAge, FHDate, DOB 3=FH_MomDiedYear, FH_MomDiedAge*/
	/*F2flag_v2	 	 	 	/*FLAG: F2Age imputed using: 1=midpoint from F3 2=FH_MomAliveAge, FHDate, DOB 3=FH_MomDiedYear, FH_MomDiedAge*/
	/*F30fix	 	 	 	/*F30fix. Do you believe that you and twin sister are genetically identical?*/
	/*F31fix	 	 	 	/*F31fix. Had genetic test if you and twin sister are genetically identical?*/
	/*F32fix	 	 	 	/*F32fix. Did test results show that you and twin sister are genetically identical?*/
	/*F33Weight	 	 	 	/*CALC: F33. Twin sibling birth weight [F33pound,F33ounce,F33DK]*/
	/*F33flag	 	 	 	/*FLAG: F33. Twin sibling birth weight - pounds given but ounces missing, don't know, or pounds/ounces out of range*/
	/*F35fix	 	 	 	/*F35fix. How many of your siblings from this birth were female (incl. stillbirths)?*/
	/*F36fix	 	 	 	/*F36fix. Do you believe you and sisters from this birth are genetically identical?*/
	/*F37fix	 	 	 	/*F37fix. Had genetic test if you and sisters(same birth) are genetically identical?*/
	/*F38fix	 	 	 	/*F38fix. Did test show that you and sisters(same birth) are genetically identical?*/
	FH_BrstFedTime	 	 	 	/*CALC: F23. How many weeks or months were you breastfed? (among those definitely breastfed [F22])*/
	FH_EarlyGest	 	 	 	/*CALC: Born at least 2 weeks before due date [F18,F19]*/

	/*FH_SoyMos	 	 	 	/*CALC: F25. How many months were you fed soy formula? (among those definitely fed soy formula[F24])*/
	/*FH_SoyStart	 	 	 	/*CALC: F26. Were you started on soy formula within the first 2 months of your life? (among those definitely fed soy formula[F24])*/
	/*Sib_All	 	 	 	/*CALC: Number of siblings (full/half/unknown type)*/
	/*Sib_All_AgeUnk	 	 	 	/*CALC: Siblings (full/half/unknown type), N unknown age in relation to participant*/
	/*Sib_All_Older	 	 	 	/*CALC: Siblings (full/half/unknown type), N older than participant*/
	/*Sib_All_SameAge	 	 	 	/*CALC: Siblings (full/half/unknown type), N same age as participant (twin/multiple)*/
	/*Sib_All_Younger	 	 	 	/*CALC: Siblings (full/half/unknown type), N younger than participant*/
	/*Sib_FLAG_NoFH	 	 	 	/*FLAG: Sibling counts not defined due to unavailable brother data*/
	/*Sib_Full	 	 	 	/*CALC: Number of full siblings (excludes half and siblings of unknown type)*/
	/*Sib_Full_AgeUnk	 	 	 	/*CALC: Full siblings (excludes half and siblings of unknown type), N unknown age in relation to participant*/
	/*Sib_Full_Older	 	 	 	/*CALC: Full siblings (excludes half and siblings of unknown type), N older than participant*/
	/*Sib_Full_SameAge	 	 	 	/*CALC: Full siblings (excludes half and siblings of unknown type), N same age as participant (twin/multiple)*/
	/*Sib_Full_Younger	 	 	 	/*CALC: Full siblings (excludes half and siblings of unknown type), N younger than participant*/
	/*Sib_Maternal	 	 	 	/*CALC: Number of siblings sharing a mother (excludes siblings of unknown type)*/
	/*Sib_Maternal_AgeUnk	 	 	 	/*CALC: Siblings sharing a mother (excludes siblings of unknown type), N unknown age in relation to participant*/
	Sib_Maternal_FirstBorn	 	 	 	/*CALC: Participant is first born among siblings sharing a mother (excludes siblings of unknown type)*/

	/*Sib_Maternal_Older	 	 	 	/*CALC: Siblings sharing a mother (excludes siblings of unknown type), N older than participant*/
	Sib_Maternal_PregLast	 	 	 	/*CALC: Years since last pregnancy among maternal siblings (0 is participant, 0.5 is <1 year, excl sibs of unk type)*/
	Sib_Maternal_PregOrder	 	 	 	/*CALC: Participant pregnancy order among siblings sharing a mother (excludes siblings of unknown type)*/

	/*Sib_Maternal_SameAge	 	 	 	/*CALC: Siblings sharing a mother (excludes siblings of unknown type), N same age as participant (twin/multiple)*/
	/*Sib_Maternal_Younger	 	 	 	/*CALC: Siblings sharing a mother (excludes siblings of unknown type), N younger than participant*/
	;
run;

data ss_utero_infant;
	set ss_utero_infant;

	if F4 in (1 2) or F7 in (1 2) then
		ui_diab_all_mother=1;
	else if F4 in (3 4) or F7 in (3 4) then
		ui_diab_all_mother=3;
	else ui_diab_all_mother=-1;

	if F6 in (1 2) or F8 in (1 2) then
		ui_hypertension_all=1;
	else if F6 in (3 4) or F8 in (3 4) then
		ui_hypertension_all=3;
	else ui_hypertension_all=-1;

	if F11 in (1 2) and F12 in (1 2) then
		ui_farm_all=1;
	else if F11 in (1 2) then
		ui_farm_all=2;
	else if F12 in (1 2) then
		ui_farm_all=3;
	else if F11 in (3 4) and F12 in (3 4) then
		ui_farm_all=4;
	else ui_farm_all=-1;

	ui_birth_weight_cont=F20Weight*1;

	if ui_birth_weight_cont=. and F21=1 then
		ui_birth_weight_cat=0.0001;
	else  ui_birth_weight_cat=F20Weight;

	if F27fix not in (1 2 3) then
		ui_multiple_birth = -1;
	else if F27fix = 1 then
		ui_multiple_birth=1;
	else if F28fix = 2 then
		ui_multiple_birth=2;
	else if F28fix =3 then
		ui_multiple_birth=3;
	else ui_multiple_birth=-1;

	if ui_multiple_birth = -1 then
		ui_twin_female = -1;
	else if ui_multiple_birth=1 then
		ui_twin_female=1;
	else if F29fix=1 then
		ui_twin_female=2;
	else if F29fix=2 then
		ui_twin_female=3;
	else ui_twin_female = -1;

	ui_preg_last_cont=Sib_Maternal_PregLast*1;
	ui_preg_last_cat=Sib_Maternal_PregLast;
	ui_preg_order_cont=Sib_Maternal_PregOrder*1;
	ui_preg_order_cat=Sib_Maternal_PregOrder;
	ui_mother_age_cont=F2Age_v1*1;
	ui_mother_age_cat=F2Age_v1;
	ui_father_age_cont=F16Age_v1*1;
	ui_father_age_cat=F16Age_v1;
	ui_early_gest=FH_EarlyGest;
	format 
	F4   F4NEW_modif.
	F5	F4NEW_modif.
	F6	F4NEW_modif.
	F7	F4NEW_modif.
	F8	 	F4NEW_modif.
	F9 	F4NEW_modif.
	F10 	 F4NEW_modif.
	F11 	 F4NEW_modif.
	F12 	 F4NEW_modif.
	F13 	 F4NEW_modif.
	F14 	 F4NEW_modif.
	F15	 	 	 F4NEW_modif.
	F22 F4NEW_modif.
	F24 F4NEW_modif.
	F174b FHYESNO_modif.
	F20WeightCat F20CAT_modif.
	F20flag FHYESNO_modif.
	F27fix F27FIX_modif.
	F28fix F28X_modif.
	F29fix F29X_modif.
	FH_BrstFedTime F23X_modif.
	ui_early_gest FHGEST_modif.
	FH_EarlyGest FHGEST_modif_new.
	ui_diab_all_mother ui_hypertension_all F4NEW_modif.
	ui_farm_all farm.
	ui_mother_age_cat ui_father_age_cat parents_age.
	ui_birth_weight_cat birth_weight.
	ui_multiple_birth F28X_modif.
	ui_twin_female twin_female.
	Sib_Maternal_FirstBorn yesno.
	ui_preg_last_cat time_preg.
	ui_preg_order_cat preg_order.;

	*/
	;
run;

data ss_utero_infant;
	set ss_utero_infant;
	rename
	F4=	ui_diab_prior_mother   	 	 	/*CALC: F4. (recoded) Before pregnant with you, did mother have diabetes?*/
	F5=	ui_epilepsy_prior	 	 	/*CALC: F5. (recoded) Before pregnant with you, did mother have epilepsy or seizure disorder?*/
	F6= ui_ges_hypertension	 	 	/*CALC: F6. (recoded) When pregnant with you, did mother have preg-related high blood pressure?*/
	F7=	ui_diab_preg_mother	 	 	/*CALC: F7. (recoded) When pregnant with you, did mother have pregnancy-related diabetes?*/
	F8=	ui_eclampsia	 	 	/*CALC: F8. (recoded) When pregnant with you, did mother have pre-eclampsia/eclampsia/toxemia?*/
	F9=	ui_vomit		 	        /*CALC: F9. (recoded) When pregnant with you, did mother have morning sickness with vomiting?*/
	F10=ui_DES	 	 	 	         /*CALC: F10. (recoded) When pregnant with you, did mother take DES (diethylstilbestrol)?*/
	F11=ui_farm_live	 	 	 	/*CALC: F11. (recoded) When pregnant with you, did your mother live on a farm?*/
	F12=ui_farm_work	 	 	 	/*CALC: F12. (recoded) Did your mother do any farm work while she was pregnant with you?*/
	F13=ui_mother_smok   	 	 	/*CALC: F13. (recoded) When pregnant with you, did your mother ever smoke cigarettes?*/
	F14=ui_father_smok   	 	 	/*CALC: F14. (recoded) Biol. father smoke cigarettes during 3 months before mother preg. w/ you?*/
	F15=ui_hh_smok	 	 	/*CALC: F15. (recoded) Did anyone in household smoke cigs at home when preg w/you (excl. mother)?*/
	F22=ui_breastfed	 	 	/*CALC: F22. (recoded) Were you ever breastfed as an infant?*/
	F24=ui_soy	 	 	/*CALC: F24. (recoded) Were you fed formulas made from soy (not regular formula)?*/
	F174b=ui_diab_father
	FH_EarlyGest=ui_early_gest_detail	 	 	 	/*CALC: Born at least 2 weeks before due date [F18,F19]*/
	FH_BrstFedTime=ui_breastfed_time		/*CALC: F23. How many weeks or months were you breastfed? (among those definitely breastfed [F22])*/
	Sib_Maternal_FirstBorn=ui_maternal_1st_born
	;
run;

data ss_utero_infant;
	set ss_utero_infant;
	drop F20Weight F20WeightCat F20flag F21 F27fix F28fix F29fix Sib_Maternal_PregLast Sib_Maternal_PregOrder F2Age_v1 F16Age_v1
	;
run;

data ss_utero_infant;
	set ss_utero_infant;
	array change _numeric_;

	do over change;
		if change in (. .A, .B, .C, .D, .E, .F, .G, .H, .I, .J, .K, .L, .M, .N, .O, .P, .Q, .R, .S, .T, .U, .V, .W, .X, .Y, .Z ) then
			change=-1;
	end;
run;

data ss_utero_infant;
	set ss_utero_infant;
	array change ui_birth_weight_cont
		ui_father_age_cont
		ui_mother_age_cont
		ui_preg_last_cont
		ui_preg_order_cont;

	do over change;
		if change =-1 then
			change=.;
	end;

	/*
	PROC CONTENTS DATA=ss_utero_infant OUT=var_info NOPRINT;
	RUN;
	DATA variables_with_formats;
	   SET var_info;
	   WHERE format = '';
	   KEEP name label;
	RUN;
	proc freq data=ss.ss_utero_infant;table _numeric_;run;*/
data ss.ss_utero_infant;
	set ss_utero_infant;
run;

proc datasets library=work nolist;
	delete ss_utero_infant;
quit;
