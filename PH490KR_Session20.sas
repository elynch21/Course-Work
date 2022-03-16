/*****************************************
Sess20 ph490kr

Emily Lynch
April 12, 2018
*****************************************/;

libname ph490kr "C:\Users\emilylynch\Desktop\ph490kr";
libname fmt "C:\Users\emilylynch\Desktop\ph490kr";
options fmtsearch=(fmt);

data sess20;
set ph490kr.vitdsess20;
run;

*3. Calculate the odds ratio for the association btwn smoking status and PMS ADJUSTED for tertile of hours per week spent sitting, interpret;
proc sort data=sess20;
by decending smoke01 decending sitq decending pmscc;
run;
proc freq data=sess20 order=data;
*syntax is adjustement*exposure*outcome, also use option "measures";
tables sitq*smoke01*pmscc/cmh measures;
run;
*stratum-specific ORs -- T3: 3.88, T2: 12.67, T1: 4.67; *adjusted 5.8 ... from above, unadjusted OR=5.35, so no evidence that sitting is a confounder;

*4. Calculate the odds ratio for the association btwn weight and PMS. Interpret.;
proc sort data=sess20;
by decending wt_med decending pmscc;
run;
proc freq data=sess20 order=data;
tables wt_med*pmscc/ measures;
run;
*not stat significant, 0.935 close to 1 and CI includes 1, no evidence between weight and PMS;

*5. Calculate the odds ratio for the association btwn weight and pms ADJUSTED for smk status. Compare this to the UNADJUSTED association btwn wt and pms. Is smoking a confounder?;
proc sort data=sess20;
by decending wt_med decending smoke01 decending pmscc;
run;
proc freq data=sess20 order=data;
tables smoke01*wt_med*pmscc/ cmh measures;
run;
*not stat signficant; *CIs overlap/are almost identical, so smoking is not a confounder btwn weight and pms;

*6. Calc the odds ratio for the association btwn tertile of hours per week spent sitting and pms. Interpret results. (Hint: need to restrict the sample to compare T2 to T1 and separatly T3 to T1;
proc sort data=sess20;
by decending sitq decending pmscc;
proc freq data=sess20 order=data;

*non significant reduced risk with sitting;
