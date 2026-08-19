options obs=100; /* cap input rows for the captured run */

/* Formats used by script.sas, taken verbatim from
   data_management/0_run_me_first_data_management.sas (the repo's own
   PROC FORMAT catalog build step). */
proc format;
	value histo        0="1) No DTC" 1="2) PTC" 2="3) FTC" 3="Unknown";
	value ajcc_seven    0="1) No DTC" 1="2) I" 2="3) II" 3="4) III" 4="5) IV" 5="Unknown";
	value invassive     0="1) Censored: No DTC/non-invasive" 1="2) Invassive DTC";
	value size          0="1) No DTC" 1="2) <1 cm" 2="3) 1-2 cm" 3="4) 2-4 cm" 4="5) 4 cm or more" 5="Unknown";
	value birth_year    -1="Unknown" 0="1) Before 1951" 1="2) 1951 or after";
	value not_DTC       0="0) No TC" 1="1) DTC" 2="2) Moderately or poorly differentiated" 3="3) Anaplastic thyroid cancer"
	                     4="4) Medullary thyroid cancer" 5="0) Histology 8265 9084, so not thyroid cancer" 6="6) Other reasons";
run;

/* Synthetic stand-in for `original` (normally LIBNAME'd from an external
   Sister Study SAS7BDAT extract). 10 fully-fabricated participants
   deliberately covering the outcome-derivation branches the script checks:
   no cancer (followed to a nominal end-of-follow-up age), PTC (8260), FTC
   (8330), anaplastic (8021), medullary (8510), moderately/poorly
   differentiated grade, a competing non-thyroid invasive cancer, and a
   competing death. No real study data is used anywhere in this bundle. */
data original;
	length psid $12 FU_ThyCa_DxStage $4;
	input psid $ Age_Baseline AgeExact_Baseline Birth_Year
	      DR315_OthCa_Inv_DxAgeExact DR315_OthCa_Inv_DxPreBaseline DR315_OthCa_Inv_Event
	      FU_MORT_Event FU_MORT_EOFAgeExact
	      FU_ThyCa_DxAgeExact FU_ThyCa_DxBehav01 FU_ThyCa_DxGrade
	      FU_ThyCa_DxHist01 FU_ThyCa_DxHist02 FU_ThyCa_DxPreBaseline FU_ThyCa_DxReportSource
	      FU_ThyCa_DxStage $ FU_ThyCa_EOFAgeExact FU_ThyCa_Event FU_ThyCa_TumorSizeLarg
	      PX_Chemo PX_Radiation;
	datalines;
99900_000001 45 45.2 1948 . 0 0 0 . . . . . . 0 0 . 80.0 0 . 0 0
99900_000002 52 52.6 1962 . 0 0 0 . 55.0 3 1 8260 . 0 1 II 55.0 1 1.5 0 0
99900_000003 39 39.1 1955 . 0 0 0 . 41.2 3 1 8330 8290 0 1 I 41.2 1 0.8 0 0
99900_000004 61 61.4 1940 . 0 0 0 . 63.0 3 3 8021 . 0 1 IVa 63.0 1 4.5 0 1
99900_000005 48 48.9 1958 . 0 0 0 . 50.1 3 1 8510 . 0 8 III 50.1 1 2.7 1 0
99900_000006 55 55.3 1949 . 0 0 0 . 56.9 3 2 8340 . 0 1 II 56.9 1 1.9 0 0
99900_000007 42 42.7 1961 44.0 0 1 0 . . . . . . 0 0 . 80.0 0 . 0 0
99900_000008 58 58.0 1944 . 0 0 1 60.5 . . . . . 0 0 . 80.0 0 . 0 0
99900_000009 36 36.5 1966 . 0 0 0 . . . . . . 0 0 . 80.0 0 . 0 0
99900_000010 63 63.2 1937 . 0 0 0 . 65.5 3 1 8344 . 0 1 IVc 65.5 1 5.1 1 1
;
run;
