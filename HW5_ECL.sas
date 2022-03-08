/*****************************
This program run the activities
for Homework 5, Spring 2018

Emily Lynch
Original: April 1, 2018
Modified: April 17, 2018
*****************************/

*1. Assign libname to folder where dataset is stored;
libname ph490kr "C:\Users\emilylynch\Desktop\ph490kr";

*read in dataset;
data HW5;
set ph490kr.lowbwt;
run;


*Label each variable and its values;
proc format library=ph490kr;
value cntrl_case 0= "0_cntrlNorm" 1= "1_caseLow";
value raceL 0= "0_white" 1= "1_black" 2= "2_other";
value smkstat 0= "0_nonsmk" 1= "1_smk";
run;

options fmtsearch=(ph490kr);

data HW5;
set HW5;

format low cntrl_case. race raceL. smoke smkstat.;

label id= "id: participant ID num";
label low= "low: case/cntrl status for low birthwght baby";
label age= "age: moms age, yrs";
label race= "race: moms race";
label smoke= "smoke: moms smoke status";
label ftv= "ftv: num of Dr visits first tri";
label bwt= "bwt: baby birthwght, grams";
run;

proc contents data=HW5;
run;

*2A. calculate mean;
proc univariate data=HW5;
var low;
run;

*2B. Test if there is a statistically significant difference in mean; 
proc ttest data=HW5;
var low;
run;
***

*2C. Test if theres a stat significant diff in mean birthweight btwn whites and blacks. Interpret your results;
proc univariate data=HW5;
class race;
var low;
run;

*3.joint distribution of having a low birthweight baby and motherÕs race;
proc freq data=HW5;
table low*race/chisq; 
run;
***

Recode the variable for number of first trimester visits to place women with 2 or more visits into a single category. Label this variables and its values as appropriate. Check your work;

data HW5;
set HW5;

ftvcat=ftv; /*SAME ISSUE AS ABOVE, THE SYNTAX NEEDS TO BE NEW=OLD*/
if ftv=0 then ftvcat=0;
if ftv=1 then ftvcat=1;
if ftv>=2 then ftvcat=2;
run;

proc format libarary=ph490kr;
value ftvcatl 0= "0_0 visits" 1= "1_1 visit" 2="2_2 or more visits";
run;

proc print data=HW5 (obs=50);
var ftv ftvcat;
run;

options fmtsearch=(ph490kr);

data HW5;
set HW5;

format ftvcat ftvcatl.;

label ftvcat= "ftvcat: DR Visit 1st tri categories";
run;

proc contents data=HW5;
run;

*6. OR for Dr visits in first tri and low birth weight;
proc sort data=HW5;
by descending ftvcat descending low;
run;

proc freq data=HW5 order=data;
where ftvcat ne 1;/*OR for T2 vs T1*/
tables ftvcat*low/measures;
run; 

proc freq data=HW5 order=data;
where ftvcat ne 2;/*OR for T3 vs T1*/
tables ftvcat*low/measures;
run;
/*OR for T3 v T1 0.625, T2 v T1 0.81*/


