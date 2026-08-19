options obs=100; /* cap input rows for the captured run */

/* Formats used by script.sas, taken verbatim from
   data_management/0_run_me_first_data_management.sas (the repo's own
   PROC FORMAT catalog build step). */
proc format;
	value AN4R_modif   -1="Unknown" 1="2) Shorter" 2="1) Same height" 3="3) Taller";
	value AN17R_modif  -1="Unknown" 1="2) Lighter" 2="1) Same weight" 3="3) Heavier";
	value BMICDC_modif -1="Unknown" 1,2="1) <25" 3="2) 25.0-29.9" 4-6="3) 30.0+";
run;

/* Synthetic stand-in for `original` (normally LIBNAME'd from an external
   Sister Study SAS7BDAT extract). 10 fully-fabricated participants with
   plausible values for the anthropometry columns the script keeps,
   including a few special SAS missing-value codes (.A/.B) the script's
   own do-over normalization step is written to handle. No real study
   data is used anywhere in this bundle. */
data original;
	length psid $12;
	input psid $ AN3 AN4 AN17 AN18 EX_BMI_CDC_final EX_BMI_final EX_WaistHip;
	datalines;
99900_000001 12 2 2 2 1 22.4 0.82
99900_000002 11 1 1 1 2 27.9 0.88
99900_000003 13 3 3 3 3 32.1 0.94
99900_000004 10 2 2 1 1 21.0 0.79
99900_000005 14 1 3 2 2 26.5 0.85
99900_000006 12 3 1 3 3 33.8 0.97
99900_000007 . . 2 2 1 23.9 0.81
99900_000008 15 2 . 1 2 28.2 .
99900_000009 11 1 1 1 1 20.6 0.77
99900_000010 13 3 3 3 3 31.4 0.92
;
run;
