/*******************************
THIS PROGRAM RUNS SESSION 12 WORK

EMILY LYNCH
ORIGINAL: MARCH 6, 2018
ORIGINAL: MARCH 6, 2018
*******************************/

*open data set*
use "C:\Users\emilylynch\Downloads\VitDsess12 (1).dta"

*label variables*
label variable id "Participant ID Number"
label variable wheeze "Ever having wheezing or whistling in chest Q53"
label define wheezeNY 1 "Yes" 0 "No"
label values wheeze wheezeNY
label variable whz_12 "Wheezing or whistling in last 12 months Q54a"
label define whz_12NYB 1 "Yes" 0 "No" 9 "Blank"
label values whz_12 whz_12NYB
label variable asthma "Ever had asthma Q55"
label define asthmaNY 1 "Yes" 0 "No"
label values asthma asthmaNY
label variable whz_ex "Wheezy during or after exercise in last 12 mnts Q56"
label define Whz_exNY 0 "No" 1 "Yes"
label values whz_ex Whz_exNY
label variable pms "PMS status "
label define PMSL 0 "Control" 1 "Case"
label values pms PMSL

*check*
describe

*create new variable breathe*
gen breathe=.
replace breathe=0 if wheeze==0 & asthma==0 & whz_ex==0
replace breathe=1 if wheeze==1 & asthma==0 & whz_ex==0
replace breathe=1 if wheeze==0 & asthma==1 & whz_ex==0
replace breathe=1 if wheeze==0 & asthma==0 & whz_ex==1
replace breathe=1 if wheeze==1 & asthma==1 & whz_ex==0
replace breathe=1 if wheeze==1 & asthma==1 & whz_ex==1
replace breathe=1 if wheeze==1 & asthma==0 & whz_ex==1
replace breathe=1 if wheeze==1 | asthma==1 | whz_ex==1
replace breathe=. if wheeze==. | asthma==. | whz_ex==.
*label*
label variable breathe "Ever had asthma or wheezing"
label define breatheL 0 "No" 1 "Yes"
label values breathe breatheL
