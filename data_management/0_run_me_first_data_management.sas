%let base_dir = C:\Users\trant4\OneDrive - National Institutes of Health\Trinh\Postdoc NCI - Risk factors and thyroid cancer\SS\data;

LIBNAME original "&base_dir\Original data";
LIBNAME ss "&base_dir";
OPTIONS NOFMTERR FMTSEARCH=(ss.D_ss_formats);
data original;
	set original.Dr00315_02_01;
	run;

proc format;
value yesno 			0="1) No" 			1="2) Yes" 		-1="Unknown";
value noyes 			0="2) No" 			1="1) Yes" 		-1="Unknown";
value histo 			0="1) No DTC"		1="2) PTC"		2="3) FTC"		3="Unknown";
value size				0="1) No DTC" 		1="2) <1 cm"		2="3) 1-2 cm"		3="4) 2-4 cm"		4="5) 4 cm or more"		5="Unknown";
value ajcc_seven 		0="1) No DTC" 		1="2) I"		2="3) II"		3="4) III"		4="5) IV"		5="Unknown";
value invassive			0="1) Censored: No DTC/non-invasive" 1="2) Invassive DTC";
value not_DTC			0="0) No TC" 1="1) DTC" 2="2) Moderately or poorly differentiated" 3="3) Anaplastic thyroid cancer" 4="4) Medullary thyroid cancer";
value birth_year		-1="Unknown" 0="1) Before 1951" 1="2) 1951 or after" ;
value edu 				0="1) Highschool or GED or less" 1="2) Some college or associate or technical degree" 2="3) Bachelor�s degree or higher" 3="Unknown";
value income 			1,2="1) <$50000" 3="2) $50000-$99999" 4="3) $100000+" -1="Unknown";
value income_childhood 	1="2) Well off" 	2="1) Middle income" 3="3) Low income" 4="4) Poor" 5="5) Unknown";
value household_compo 	1="1) Two parents" 	2="2) Single parent" 3="3) Other" 4="Unknown";
value marital 			0="2) Single/never married" 1="1) Married/Committed relationship" 2="3) Divorced/Widowed/Separated" 3="Unknown";
value race 				0="1) Non-Hispanic White" 1="2) Non-Hispanic Black" 2="3) Hispanic" 3="4) Non-Hispanic all other races" 4="Unknown" ;
value race_other		0="1) Non-Hispanic White" 1="2) Non-Hispanic Black" 2="3) Hispanic" 3="5) Non-Hispanic other races: Asian" 
						4="6) Non-Hispanic other races: American Indian/Alaska Native" 5="7) Non-Hispanic other races: Hawaiian/Pacific Islander " 6="Unknown" ;
value residence			-1="Unknown" 1="1) Urban, suburban, small town" 2="2) Rural areas";
value adi				-1="Unknown" 0,1="1) Less than 30" 2,3="2) 30 or more" ;
value smok 				0="1) Never smoked" 1="2) Past smoker" 2="3) Current smoker" -1="Unknown";
value pack_yr 			0="1) Never smoked" 1="2) 10 pack-years or less" 2="3) 10-20 pack-years" 3="4) More than 20 pack-years" 4="Unknown";
value packyr_child 		0="1) Never smoked before 20" 1="2) 5 pack-years or less" 2="3) More than 5 pack-years" 3="Unknown";
value age_start_smok 	0="1) Never smoked" 1="2) 15 years of age or less" 2="3) 15-20 years of age" 3="4) More than 20 years of age" 4="Unknown";
value age_stop_smok 	0="1) Never smoked" 1="2)  20 years of age or less" 2="3) 20-30 years of age" 3="4) 30-40 years of age" 4="5) More than 40 years of age" 5="Unknown";
value yr_smok 			0="1) Never smoked" 1="2) 10 years or less" 2="3) 10-20 years" 3="4) 20-30 years" 4="5) More than 30 years" 5="Unknown";
value yr_smok_child 	0="1) Never smoked before 20" 1="2) 5 years or less" 2="3) More than 5 years" 3="Unknown";
value ETS_child_yr 		0="1) No secondhand smoking during childhood" 1="2) 10 years or less" 2="3) More than 10 years" 3="Unknown";
value ETS_total_yr 		0="1) No secondhand smoking ever" 1="2) 10 years or less" 2="3) 10-20 years" 3="4) 20-30 years" 4="5) More than 30 years" 5="Unknown";
value alc_status 		0="1) Never drinker" 1="2) Former drinker" 2="Drinker: <1 drink/week" 3="Drinker: 1+ drink/week" -1="Unknown";
value binge				0="1) 0 times " 1="2) Less than 25 times" 2="3) 25-240 times" 3="4) 240+ times" 4="Unknown";	
value drinkPY 			0="1) 0 drink/year" 1="2) Less than 60 drinks/year" 2="3) 60-229 drinks/year" 3="4) 230 drinks/year or more" 4="Unknown";
value alc_age_start 	0="1) Never drinker" 1="2) Before 15 years of age" 2="3) 15-20 years of age" 3="4) 20 years of age or older" 4="Unknown";
value F4new_modif 		-1="Unknown" 1-2="2) Definitely/Probably" 3-4="1) Probably not/Definitely not"    ; 
value farm				-1="Unknown" 1="2) Both lived and worked on a farm" 2="3) Lived on a farm" 3="4) Worked on a farm" 4="1) Neither lived nor worked on a farm";
value F18X_modif 		-1="Unknown" 1="1) Within 1 wk of due date" 2="2) >1 wk before due date" 3="3) >1 wk after due date" ;
value F19X_modif 		-1="Unknown" 1="1) < 2 weeks" 2="2) 2 - 4 weeks" 3="3) 1 - 2 months" 4="4) > 2 months"; 
value F20CAT_modif 		-1="Unknown" 1="1)  < 5 pounds" 2="2) 5 - <6 pounds" 3="3) 6 - <7 pounds" 4="4) 7 - <8 pounds" 5="5) 8 - <9 pounds" 6="6) 9 - <10 pounds"
						7="7) 10 - <11 pounds" 8="8) 11 - <12 pounds" 9="9) 12 - <13 pounds" 10="10) 13 - <14 pounds" 11="11) DK, 5 or more lbs"; 
value F21X_modif 		-1="Unknown" 1="1) < 5 pounds" 2="2) 5+ pounds"; 
value F23X_modif 		-1="Unknown" 1="2) < 6 weeks" 2="3) 6 wks - 3 months" 3="4) 4 - 6 months" 4="1) > 6 months"; 
value F25X_modif 		-1="Unknown" 1="1) < 1 month" 2="2) 1 - 3 months" 3="3) 4 - 6 months" 4="4) 7 - 9 months" 5="5) 10 - 12 months" 6="6) > 1 year"; 
value F27FIX_modif 		-1="Unknown" 1="1) Single birth" 2="2) Multiple birth" 3="3) Possible multiple birth"; 
value F28X_modif		1="1) Single birth" 2-7="2) Multiple birth" -1="Unknown"; 
value F29X_modif 		-1="Unknown" 1="1) Male" 2="2) Female"; 
value F32X_modif 		-1="Unknown" 1="1) Identical" 2="2) Non-identical"; 
value F35X_modif 		-1="Unknown" 0="1) None" 1="2) 1" 2-6="3) 2+"; 
value F38X_modif 		-1="Unknown" 1="2) All non-identical" 2-3="3) Identical to at least one"; 
value FHGEST_modif 		-1="Unknown" 0="1) Born post-term or up to 2 weeks pre-term" 1,2="2) Born at least 2 weeks before the due date"; 
value FHGEST_modif_new		-1="Unknown" 0="1) Born post-term or up to 2 weeks pre-term" 1="2) Yes, 2 to 4 weeks pre-term" 2="3) Yes, more than 4 weeks pre-term"; 
value FHMISS2X_modif 	.D ="Unknown" .E="Unknown" .M="Unknown".P="Unknown".Q="Unknown" 90="Unknown" 98="Unknown" 99="Unknown"; 
value FHYESNO_modif 	-1="Unknown" 0="1) No" 1="2) Yes"; 
value parents_age 		0-<25="1) Before 25�years" 25-<30="2) Between 25 and 29�years" 30-<35="3) Between 30 and 34�years" 35-high="4) 35+�years" -1="Unknown";
value birth_weight 		0-<5.51="2) < 2500�g" 5.51-<8.82="1) Between 2500 and 3999�g" 8.82-high="3) 4000+�g" -1="Unknown";
value size_ges 			 0="1) Small-for-gestational age" 1="2) Normal-for-gestational age" 2="3) Large-for-gestational age" 3="Unknown";
value twin_female 		-1="Unknown" 1="2) Single birth" 2="3) Multiple birth, male" 3="4) Multiple birth, female";
value time_preg 		 0="1) First born" 0.5-2 = "2) Equal or less than 2 year" 3-5="3) 3-5 years" 6-high="4) More than 5 years" -1="Unknown";
value preg_order 		1="1) First born" 2="2) Second born" 3="3) Third born" 4-high="4) Fourth born or more" -1 = "Unknown";
value AN17R_modif 		-1="Unknown" 1="2) Lighter"	2="1) Same weight"	3="3) Heavier"	;
VALUE AN4R_modif 		-1="Unknown" 1="2) Shorter"	2="1) Same height"	3="3) Taller"	;
VALUE BMICDC_modif 		-1="Unknown" 1,2="1) <25"	3="2) 25.0-29.9"	4-6="3) 30.0+" /*1="2) < 18.5"	2="1) 18.5-24.9"	3="3) 25.0-29.9"	4="4) 30.0+"	5="5) 35.0-39.9"	6="6) 40.0+"	*/;
value hrs_week 			0-<1="1) Less than 1 hour" 1-<4="2) 1-4 hours" 4-<7="3) 4-7 hours" 7-high="4) 7 hours or more" -1="Unknown";
value met_week 			0-20.999999="1) Less than 21 met-hours/week" 21-41.999999="2) 21-42 met-hours/week" 42-high="3) 42 met-hours/week or more" -1="Unknown";
value thelarche 		0-10="2) Less than 11 years of age" 11-13="1) 11-13 years of age" 14-20="3) 14 years of age or more" -1, 21-high ="Unknown";
value meno_age 			 0="1) Still have periods" 1="2) Yes, before 45" 2="3) Yes, between 45 and 55" 3="4) Yes, after 55" 4="5) Yes, unknown age" -1="Unknown";
value meno_cause 		1="1) Yes, natural" 2-5, 10= "2) Yes, medical reasons (surgery, chemotherapy, suppression medications or birth control pills)" 6, 7, 11="3) Still have periods" 8,9="Unknown";
value first_preg 		 0="5) Never have any full-term pregnancy" 1="1) Less than 25 years of age" 2="2) 25-29 years of age" 3,4="3) 30 years of age or more" -1="Unknown";
value last_preg 		 0="4) Never have any full-term pregnancy" 1="1) Less than 10 years" 2="2) 10-20 years" 3="3) 20 years or more" -1="Unknown";
value nb_preg 			 0="1) 0" 1="2) 1" 2="3) 2" 3-high="4) 3 or more" -1="Unknown";
value age_menarche 		0-<12="2) Less than 12 years of age" 12-<14="1) 12-14 years of age" 14-20="3) 14 years of age or more" -1,21-high="Unknown";
value BC_ingredient 	 0="2) No birth control before 20 years of age" 1="1) Combined hormonal contraception" 2="3) Progestin-only contraception" 3="4) Unknown ingredient" 4="Unknown birth control status before 20";
value bc_ado_dur_all	 0="1) Never used birth control" 1="2) Yes, less than 5 years" 2="3) Yes, 5 years or more" 3="4) Yes, unknown duration" 4="Started after 20 years of age" 5="Unknown";
value bc_ado_dur 		 0="1) No" 1="2) Yes, less than 5 years" 2="3) Yes, 5 years or more" 3="4) Yes, unknown duration" 4="Unknown";
value bc_min_age 		1,2="2) Started at 20 years of age or less" 3="4) Started after 20 years of age" 0="1) Never used birth control" 4="Unknown birth control status";
value bc_type 			 0="2) No birth control before 20 years of age" 1="1) Oral pills" 2="3) Implants (Norplant)" 3="4) IUD" 4="Injection (Depo-Provera)" 5="5) Patch" 6="6) Other methods" 7="7) Unknown";
value mammo 			1-2="1) Less than two years ago" -1="Never had a mammogram or the last time was more than 2 years ago" ;
value physical_exam 	1-2="1) Less than one year ago" -1="Never had one or more than one year ago";
value RSYESNO14_modif 	1="2) Yes" 2="1) No" other="Unknown";
value exclusion 		1="1) Any history of invassive cancer prior to baseline"
						2="2) Self-reported total thyroidectomy prior to baseline"
						3="3) Self-reported chemotherapy or radiotherapy for cancer(s) prior to baseline"
						4="4) Withdrawal from the Sister study";
run;
proc catalog catalog = formats;
  copy out = ss.D_ss_formats;
  run;
quit;

