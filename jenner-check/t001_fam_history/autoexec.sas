options obs=100; /* cap input rows for the captured run */

/* Format used by the family-history recode in script.sas, taken verbatim
   from data_management/0_run_me_first_data_management.sas (the repo's own
   PROC FORMAT catalog build step). */
proc format;
	value yesno 0="1) No" 1="2) Yes" -1="Unknown";
run;

/* Synthetic stand-in for `original` (normally LIBNAME'd from an external
   Sister Study SAS7BDAT extract). 10 fully-fabricated participants with
   plausible values for the family-history columns the script keeps. No
   real study data is used anywhere in this bundle. */
data original;
	length psid $12;
	input psid $ Thy_1stDegr Thy_1stDegr_Nmiss Thy_1stDegr_ge50 Thy_1stDegr_lt50
	      Thy_1stDegr_wHalf Thy_1stDegr_wHalf_Nmiss
	      FH_MomAlive FH_MomAliveAge FH_MomDiedAge FH_DadAlive FH_DadAliveAge FH_DadDiedAge;
	datalines;
99900_000001 0 0 0 0 0 0 1 61 . 1 64 .
99900_000002 1 0 1 0 1 0 1 58 . 0 . 70
99900_000003 0 0 0 0 0 0 0 . 72 1 66 .
99900_000004 2 0 1 1 2 0 1 70 . 1 74 .
99900_000005 0 1 0 0 0 1 1 55 . 1 59 .
99900_000006 1 0 0 1 1 0 0 . 66 0 . 68
99900_000007 0 0 0 0 0 0 1 63 . 1 67 .
99900_000008 3 0 2 1 3 0 1 60 . 1 62 .
99900_000009 0 0 0 0 0 0 1 57 . 0 . 75
99900_000010 1 1 0 1 1 1 1 64 . 1 69 .
;
run;
