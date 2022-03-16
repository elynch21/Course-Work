/******************************
THIS PROGRAM RUNS STEPS NEEDED
FOR COMPLETION OF SESSIONS 9
PH490KR, SPRING 2018

Emily Lynch
ORIGINAL: FEBRUARY 20, 2018
MODIFIED: FEBRUARY 20, 2018
******************************/

use "C:\Users\emilylynch\Downloads\VitDsess9 (1).dta"

**Label**
label variable curmed "Meds taken for PMS"
label variable nra_sit1 "Non-Rec Activity/Time Sitting per Week"
label variable nra_sit1 "Time @ computer, in class, work, driving/week"
label variable nra_sit2 "Time reading, talking, eating/week"
label variable nra_sit3 "Time watching TV/week"
label variable alc_ev "12 drinks in entire life"
label variable alc_num "On days drinking how many drinks"
label variable tan "tanning bed past 6 mnths"
label variable tan_freq "Tan, how often"
label variable wst_in "waist circum inches"
label variable OHD "Serum 25-hydroxy VitD Level"
label define nra_sit1L 1 "Zero Hours" 2 "One Hour" 3 "2-5 Hours" 4 "6-10 Hours" 5 "11-20 Hours" 6 "21-40 Hours" 7 "41-60 Hours" 8 "61-90 Hours" 9 "Over 90 Hours"
label values nra_sit1 nra_sit1L
label values nra_sit2 nra_sit1L
label values nra_sit3 nra_sit1L
label define Alc_evL 1 "Yes" 0 "No" 99 "Missing"
label values alc_ev Alc_evL
label define tanL 1 "Yes" 0 "No" 9 "Missing"
label values tan tanL
label define tan_freqL 1 "More than once a week" 2 "Weekly" 3 "Bi-Weekly" 4 "Monthly" 5 "Bi-Monthly" 6 "Only once or twice" 9 "Missing"
label values tan_freq tan_freqL

*Check variable alc_num" for errors, calc mean for number of alc drinks*
tab alc_num, missing
summarize alc_num

*Make new cloned variable "alc_num2"*
*clonevar: Data > Create or change data > Other variable-creation commands > *
* > Clone existing variable*
clonevar alc_num2 = alc_num

*fix 99=missing and 61 with replace*
replace alc_num2=0 if alc_num==99 & alc_ev==0
replace alc_num2=. if alc_num==99 & alc_ev==99
replace alc_num2=. if alc_num==61

*Check work*
tab alc_num2, missing
summarize alc_num2

*recode "tan_freq" to group anyone who tans bi-monthly or more into category*
clonevar tan_freq2 = tan_freq
replace tan_freq2=5 if tan_freq<=5

*check*
tab tan_freq2, missing

