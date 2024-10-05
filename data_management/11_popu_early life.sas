proc sql;
	create table ss_earlylife_popu as

	select distinct ident.*, utero.*,reprod.*,anthropometry.*, phyact.*,alc.*,smok.*,
		ses.*,family.*, illness.*

	from ss.ss_ident_cancer ident 
		left join ss.ss_utero_infant 		utero			on ident.psid = utero.psid
		left join ss.ss_reprod_hormone 		reprod			on ident.psid = reprod.psid
		left join ss.ss_anthropometry 		anthropometry	on ident.psid = anthropometry.psid
		left join ss.ss_phy_act 			phyact			on ident.psid = phyact.psid
		left join ss.ss_alc 				alc				on ident.psid = alc.psid
		left join ss.ss_smok 				smok			on ident.psid = smok.psid
		left join ss.ss_demo_ses 			ses				on ident.psid = ses.psid
		left join ss.ss_fam_history 		family			on ident.psid = family.psid
		left join ss.ss_illness_treatment 	illness			on ident.psid = illness.psid
;
quit;

data ss_earlylife_popu;
	set ss_earlylife_popu;

	if ident_cancer_bl =1 then
		exclusion = 1 /*Any history of invassive cancer prior to baseline*/;
	/*else if tre_thyroidectomy=1 then
		exclusion = 2 /*Self-reported total thyroidectomy prior to baseline;*/
	else if ident_treatment_cancer_bl=1 then exclusion = 3; /*Self-reported chemotherapy or radiotherapy for cancer(s) prior to baseline*/
	else if psid in ("00315_208117" "00315_225588" "00315_226048" "00315_227709" "00315_242695") then
		exclusion = 4;

	/*Withdrawal from the Sister study*/
	/* exclude individuals who had missing data (W) for all variables- 27.06.2023 (ttvt) */
	else exclusion = 0;
	format exclusion exclusion.;
run;

proc freq data=ss_earlylife_popu;
	table exclusion*PX_Chemo*PX_Radiation;
;
run;

data ss.ss_earlylife_popu;
	set ss_earlylife_popu;

	if exclusion = 0;
run;

proc export data=ss.ss_earlylife_popu
	outfile="&base_dir/ss_earlylife_popu.csv"
	dbms=csv
	replace;
run;
proc datasets library=work nolist;
	delete ss_earlylife_popu;
quit;
