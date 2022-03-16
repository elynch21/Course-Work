/*******************************************
This program runs the activites for sess 19
ph490kr spring 2018

Emily Lynch
created: April 10, 2018
modified: April 10, 2018
*******************************************/;

*Assign Libname;
libname ph490kr "C:\Users\emilylynch\Desktop\ph490kr";

*read in dataset to temp data set;
data sess19;
set ph490kr.vitdsess19;
run;

*options statement to set formats;
options fmtsearch=(ph490kr);
data sess19;
set sess19;
run;

proc univariate data=sess19;
var bmi;
class smoke01;
run;

proc means data=sess19 mean std p25 p50 p75;
var bmi;
class smoke01;
run;

*3 tabulate the number of underweight, normal, overweight, and obese*;
*a. cross tabulate BMI category w/ smk status;
proc freq data=sess19;
table bmi_cat;
run;

proc freq data=sess19;
table bmi_cat*smoke01/chisq;
run;

*4 Calculate the mean SD 25th 50th 75th percentile for weight;
proc univariate data=sess19;
var wt_lbs;
run;

proc means data=sess19 mean std p25 p50 p75;
var wt_lbs;
run;

*4a;
proc univariate data=sess19;
var wt_lbs;
class nsaid;
run;

proc means data=sess19 mean std p25 p50 p75;
var wt_lbs;
class nsaid;
run;

*4b;
proc ttest data=sess19;
class nsaid;
var wt_lbs;
run;
*fail to reject the null hypothesis, p value greater than 0.05, conculude mean weight not diff btwn nsaid users and non users;

*5 tab nsaid status; 
proc freq data=sess19;
tables nsaid;
run;

*5AB;
proc freq data=sess19;
tables bmi_cat*nsaid/chisq;
run;
*fail to reject no assoc btwn bmi cat and nsaid;

*6;
proc means data=sess19; 
where ht_tert eq 3;
var bmi;
run;

*7;
proc ttest data=sess19;
where bmi_cat eq 2;
class smoke01;
var tot_sit;
run;

*fail to reject null, no association;
