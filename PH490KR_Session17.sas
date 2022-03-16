/*******************************
This program preforms activities 
for session 17, spring 2018

Emily Lynch
Original: March 29, 2018
Modified: March 29, 2018
*******************************/

*Start by assigning libname to folder where dataset; 
libname ph490kr "C:\Users\emilylynch\Desktop\ph490kr";

data sess17; /*read in data into a temporary dataset that is stored in work and called sess17*/
set ph490kr.vitdsess17; /*this is the dataset being read in*/
run;

*1a. check age_cig;
proc means data=sess17;
var age_cig;
run;

proc freq data=sess17;
table age_cig*ev_smk;
run;

*fix by setting 99 to missing;
data sess17;
set sess17; *note: this code will overwrite our temp;
age_cigkr=age_cig;
if age_cig=99 then age_cigkr=.;
if age_cig=0 then age_cigkr=.;
run;

*check our work;
proc means data=sess17;
var age_cigkr;
run;

proc print data=sess17 (obs=50);
var age_cig age_cigkr;
run;

*1b. check age_qt;
proc means data=sess17;
var age_qt;
run;

proc freq data=sess17;
table age_qt*age_cigkr;
run;

*fix by setting 99 to missing;
data sess17;
set sess17;
age_qtkr=age_qt;
if age_qt=99 then age_qtkr=.;
if age_qt=0 then age_qtkr=.;
run;

*check work;
proc means data=sess17;
var age_qtkr;
run;

proc print data=sess17 (obs=50);
var age_qt age_qtkr;
run;

*1c. check cig_day;
proc means data=sess17;
var cig_day;
run;

proc freq data=sess17;
table cig_day*age_qtkr;
run;

*fix by setting 99 to missing;
data sess17;
set sess17;
cig_daykr=cig_day;
if cig_day=99 then cig_daykr=.;
if cig_day=0 then cig_daykr=.;
run;

*check work;
proc means data=sess17;
var cig_daykr;
run;

proc print data=sess17 (obs=50);
var cig_day cig_daykr;
run;

*1d. check yrs_oc;

*1e. check curr_oc;

*2. Label each variable and its values;
proc format library=ph490kr;
value ynf 0="0_no" 1="1_yes";
value cig_dayf 1="1_1-10" 2="2_11-20" 3="3_21-30" 4="4_31-40" 5="5_41+";

options 

data sess17;
set sess17;

format 

*3. Save a permanent SAS dataset that includes the original data and the new variables created;
data ph490kr.VitDsess17_working;
set sess17;
run;
