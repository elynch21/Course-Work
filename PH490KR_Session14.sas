/* this program completes activities 
for session 14, spring 2018

Emily Lynch
March 20, 2018*/

libname ph490kr "C:\Users\emilylynch\Downloads";

data sess14;
set ph490kr.vitdsess14;
run;

proc contents data=sess14;
run;

proc print data=sess14; /*demonstrate proc print*/
var ev_smk cur_smk;
run;

proc print data=sess14 (obs=100);
var ev_smk cur_smk;
run;

proc print data=sess14;
var brand cur_smk;
where cur_smk=1;
run;

proc print data=sess14;
var cig_day age_cig;
where age_cig>15 & age_cig^=99;
run;

proc sort data=sess14;
by cur_smk;
run;

proc print data=sess14;
by cur_smk; 
var cig_day;
run;


data cursmk; /*make new dataset...temporary*/
set sess14; 
where cur_smk=1; /*set it to be sess14 data but only include people who are current smokers*/
run;

data ph490kr.cursmk; /*make new dataset...saving it to a lib*/
set sess14; 
where cur_smk=1; /*set it to be sess14 data but only include people who are current smokers*/
run;
