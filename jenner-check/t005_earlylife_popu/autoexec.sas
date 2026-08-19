options obs=100; /* cap input rows for the captured run */

/* Format used by script.sas, taken verbatim from
   data_management/0_run_me_first_data_management.sas (the repo's own
   PROC FORMAT catalog build step). */
proc format;
	value exclusion
		1="1) Any history of invassive cancer prior to baseline"
		2="2) Self-reported total thyroidectomy prior to baseline"
		3="3) Self-reported chemotherapy or radiotherapy for cancer(s) prior to baseline"
		4="4) Withdrawal from the Sister study";
run;

/* Synthetic stand-ins for the nine ss.ss_* domain tables the original
   script left-joins on psid (normally each built by an earlier numbered
   script in data_management/ from the shared Sister Study extract). 8
   fabricated participants shared across every table, covering each
   exclusion branch: baseline cancer, prior cancer treatment, the
   withdrawal-list placeholder, and clean/eligible rows. No real study
   data is used anywhere in this bundle. */
data ss_ident_cancer;
	length psid $12;
	input psid $ ident_cancer_bl ident_treatment_cancer_bl PX_Chemo PX_Radiation;
	datalines;
99900_000001 0 0 0 0
99900_000002 1 0 0 0
99900_000003 0 1 1 0
99900_000004 0 0 0 0
99900_000005 0 0 0 1
99900_000006 0 0 0 0
99900_000009 0 0 0 0
99900_000010 0 0 0 0
;
run;

data ss_utero_infant;
	length psid $12;
	input psid $ utero_birthweight_cat;
	datalines;
99900_000001 1
99900_000002 2
99900_000003 1
99900_000004 3
99900_000005 1
99900_000006 2
99900_000009 1
99900_000010 2
;
run;

data ss_reprod_hormone;
	length psid $12;
	input psid $ reprod_menarche_cat;
	datalines;
99900_000001 1
99900_000002 2
99900_000003 1
99900_000004 3
99900_000005 1
99900_000006 2
99900_000009 1
99900_000010 3
;
run;

data ss_anthropometry;
	length psid $12;
	input psid $ an_bmi_cat;
	datalines;
99900_000001 1
99900_000002 2
99900_000003 1
99900_000004 3
99900_000005 1
99900_000006 2
99900_000009 1
99900_000010 2
;
run;

data ss_phy_act;
	length psid $12;
	input psid $ phy_act_cat;
	datalines;
99900_000001 1
99900_000002 1
99900_000003 2
99900_000004 3
99900_000005 1
99900_000006 2
99900_000009 1
99900_000010 3
;
run;

data ss_alc;
	length psid $12;
	input psid $ alc_cat;
	datalines;
99900_000001 0
99900_000002 1
99900_000003 2
99900_000004 3
99900_000005 0
99900_000006 1
99900_000009 0
99900_000010 2
;
run;

data ss_smok;
	length psid $12;
	input psid $ smok_cat;
	datalines;
99900_000001 0
99900_000002 1
99900_000003 2
99900_000004 0
99900_000005 1
99900_000006 0
99900_000009 0
99900_000010 2
;
run;

data ss_demo_ses;
	length psid $12;
	input psid $ demo_edu_cat;
	datalines;
99900_000001 1
99900_000002 2
99900_000003 1
99900_000004 3
99900_000005 2
99900_000006 1
99900_000009 1
99900_000010 3
;
run;

data ss_fam_history;
	length psid $12;
	input psid $ fam_history_DTC;
	datalines;
99900_000001 0
99900_000002 1
99900_000003 0
99900_000004 0
99900_000005 1
99900_000006 0
99900_000009 0
99900_000010 1
;
run;

data ss_illness_treatment;
	length psid $12;
	input psid $ illness_thyroid_disease;
	datalines;
99900_000001 0
99900_000002 0
99900_000003 0
99900_000004 1
99900_000005 0
99900_000006 0
99900_000009 0
99900_000010 0
;
run;
