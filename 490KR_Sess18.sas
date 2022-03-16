/************************************
This program preforms the activities 
for Session 18, Spring 2018

Emily Lynch
Created: April 3, 2018
Modified: April 3, 2018
************************************/;

*1. Assign libname to folder where dataset is stored;
libname ph490kr "C:\Users\emilylynch\Desktop\ph490kr";

*read in dataset to a temp dataset;
data sess18;
set ph490kr.vitdsess18;
run;

*check;
proc contents data=sess18;
run;

*2. Label each variable and their values;

proc format library=ph490kr;
value alc_evNYM 0= "0_No" 1= "1_Yes" 99= "99_Missing";
value tanNYM 0= "0_No" 1= "1_Yes" 9= "9_Missing";
value tan_freqL 1= "1_more than once a week" 2= "2_weekly" 3= "3_bi-weekly" 4= "4_monthly" 5= "5_bi-monthly" 6= "6_only once or twice" 9= "9_missing";
run;

options fmtsearch=(ph490kr);

data sess18;
set sess18;

format alc_ev alc_evNYM. tan tanNYM. tan_freq tan_freqL.;

label id= "id: participant ID number";
label alc_ev= "alc_ev: at least 12 alc bev in entire life";
label alc_num= "alc_num: on drinking days how many drinks had";
label tan= "tan: past 6mnts have you been in tanning bed";
label tan_freq= "tan_freq: If tanning, how often";
label wst_in= "wst_in: waist circumf, inches";
label OHD= "OHD: Serum 25-Hydroxy Vit D level";
run;

proc contents data=sess18;
run;

*2. Check "alc_num" for errors and fix issues. Calc mean num of alc drinks per occasion in pop;

proc means data=sess18;
var alc_num; 
run;

proc freq data=sess18;
table alc_num*alc_ev/missing;
run;


data sess18;
set sess18;
alc_numEL=alc_num;
if alc_num=99 & alc_ev=0 then alc_numEL=0;
if alc_num=. & alc_ev=0 then alc_numEL=0;
if alc_num=99 & alc_ev=99 then alc_numEL=.;
run;

proc means data=sess18;
var alc_numEL;
run;

proc print data=sess18 (obs=50);
var alc_num alc_numEL;
run;

*3.;
tan_freqEL=tan_freq;
if tan_freq<=5 then tan_freqEL=5;
if tan_freq
