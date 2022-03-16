/*This program runs class
activity for session 15*/

/*Emily Lynch
March 22, 2018*/

*1. Use a lib name statement;
libname ph490kr "C:\Users\emilylynch\Desktop\ph490kr";

*2. write format labels;
proc format;
value ynf 0="0:no" 1="1:yes";
value cig_num 1="1-10" 2="11-20" 3="21-30" 4="31-40" 5="41 or more" 99="blank";
run;

*3. assign labels;

options fmtsearch=(ph490kr);

data work.sess15;
set ph490kr.VitDsess14;
label ev_smk="ev_smk: ever smoked 20+ packs cig";
format ev_smk ynf.;
label cur_smk="cur_smk: currently smoke";
format cur_smk ynf.;
label cig_day="cig_day: how many cigarettes per day";
format cig_day cig_num.;
run;

*4. save a permanent copy of the dataset, and describe it using proc contents;
data ph490kr.vitdsess14_ecl;
set work.sess15;
run;

*could use ph490kr.vitdsess14_ecl or sess15 but best practice is to use ph490kr.vitdsess14_ecl;
proc contents data=ph490kr.vitdsess14_ecl;
run;


