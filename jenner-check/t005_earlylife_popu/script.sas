/* Adapted from data_management/11_popu_early life.sas (original repo file)
   -- the final assembly step that left-joins all nine per-domain analysis
   datasets on psid and applies the study's exclusion hierarchy. Same
   substitution approach as the other bundles: each ss.ss_* input is a
   small synthetic table (fabricated psids, no real study data), and the
   ss.* output/export is redirected to WORK/skipped.

   One additional substitution here: the original script's withdrawal-list
   branch (exclusion=4) hardcodes a short list of literal Sister Study
   psids to drop. Those are real participant identifiers from the source
   repo and are deliberately NOT reproduced here -- the branch below checks
   membership in a placeholder list built from this bundle's own synthetic
   psids instead, so the exclusion-hierarchy logic (including which
   condition wins when several would apply) still runs unmodified. */

proc sql;
	create table ss_earlylife_popu as

	select distinct ident.*, utero.*,reprod.*,anthropometry.*, phyact.*,alc.*,smok.*,
		ses.*,family.*, illness.*

	from ss_ident_cancer ident
		left join ss_utero_infant 		utero			on ident.psid = utero.psid
		left join ss_reprod_hormone 		reprod			on ident.psid = reprod.psid
		left join ss_anthropometry 	anthropometry	on ident.psid = anthropometry.psid
		left join ss_phy_act 			phyact			on ident.psid = phyact.psid
		left join ss_alc 				alc				on ident.psid = alc.psid
		left join ss_smok 				smok			on ident.psid = smok.psid
		left join ss_demo_ses 			ses				on ident.psid = ses.psid
		left join ss_fam_history 		family			on ident.psid = family.psid
		left join ss_illness_treatment 	illness			on ident.psid = illness.psid
;
quit;

data ss_earlylife_popu;
	set ss_earlylife_popu;

	if ident_cancer_bl =1 then
		exclusion = 1 /*Any history of invassive cancer prior to baseline*/;
	else if ident_treatment_cancer_bl=1 then exclusion = 3; /*Self-reported chemotherapy or radiotherapy for cancer(s) prior to baseline*/
	else if psid in ("99900_000009" "99900_000010") then
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

data want_ss_earlylife_popu;
	set ss_earlylife_popu;

	if exclusion = 0;
run;

proc print data=want_ss_earlylife_popu noobs;
	title "ss_earlylife_popu (bundle output; original also PROC EXPORTs to csv)";
run;

proc datasets library=work nolist;
	delete ss_earlylife_popu;
quit;
