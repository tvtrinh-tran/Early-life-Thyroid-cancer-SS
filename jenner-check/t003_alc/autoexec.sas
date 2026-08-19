options obs=100; /* cap input rows for the captured run */

/* Formats used by script.sas, taken verbatim from
   data_management/0_run_me_first_data_management.sas (the repo's own
   PROC FORMAT catalog build step). */
proc format;
	value alc_status  0="1) Never drinker" 1="2) Former drinker" 2="Drinker: <1 drink/week" 3="Drinker: 1+ drink/week" -1="Unknown";
	value drinkPY     0="1) 0 drink/year" 1="2) Less than 60 drinks/year" 2="3) 60-229 drinks/year" 3="4) 230 drinks/year or more" 4="Unknown";
	value binge       0="1) 0 times " 1="2) Less than 25 times" 2="3) 25-240 times" 3="4) 240+ times" 4="Unknown";
	value alc_age_start 0,3="1) Never drank before 20 years of age" 1,2="2) Before 20 years of age" 4="Unknown";
run;

/* Synthetic stand-in for `original` (normally LIBNAME'd from an external
   Sister Study SAS7BDAT extract). 10 fully-fabricated participants
   covering the branch conditions the recode logic checks (never/former/
   current drinker, various pack/drink totals, negative "unknown" sentinel
   codes). No real study data is used anywhere in this bundle. */
data original;
	length psid $12;
	input psid $ AL_DrinksPY1 AL_Time1 AL_StatusCat_T0 AL_StartAge_T0;
	datalines;
99900_000001 0 0 0 .
99900_000002 45 10 1 17
99900_000003 180 100 2 14
99900_000004 300 260 3 18
99900_000005 -1 -1 -1 -1
99900_000006 20 0 1 22
99900_000007 250 5 3 12
99900_000008 0 0 0 .
99900_000009 90 30 2 19
99900_000010 5 260 3 21
;
run;
