data ss_fam_history;
	set original;
	keep
		psid
		Thy_1stDegr	 	 	 	/*Number of 1st degree relatives (parents, full siblings, children) with thyroid cancer*/
	Thy_1stDegr_Nmiss	 	 	 	/*Number of 1st degree relatives (parents, full siblings, children) missing thyroid cancer status*/
	Thy_1stDegr_ge50	 	 	 	/*Number of first degree relatives (parents, full siblings, children) dx age 50+ with thyroid cancer*/
	Thy_1stDegr_lt50	 	 	 	/*Number of first degree relatives (parents, full siblings, children) dx under age 50 with thyroid cancer*/
	Thy_1stDegr_wHalf	 	 	 	/*Number of 1st degree relatives and half siblingswith thyroid cancer*/
	Thy_1stDegr_wHalf_Nmiss	 	 	 	/*Number of 1st degree relatives and half siblings missing thyroid cancer status*/

	FH_MomAlive
FH_MomAliveAge
FH_MomDiedAge
FH_DadAlive
FH_DadAliveAge
FH_DadDiedAge;
run;

data ss_fam_history;
	set ss_fam_history;

	if Thy_1stDegr=0 then
		fam_history_DTC=0;
	else if Thy_1stDegr>0 then
		fam_history_DTC=1;
	else fam_history_DTC=-1;
	format fam_history_DTC yesno.;
run;

data ss.ss_fam_history;
	set ss_fam_history;
	keep psid fam_history_DTC;
run;

proc datasets library=work nolist;
	delete ss_fam_history;
quit;
