/******************************
Emily Lynch
PH490KR Homework #2
******************************/

*Open data set*
use "/Users/emily_lynch21/Downloads/VitDhw1.dta"


*Open log file*


*label the variables and their values*
label variable id "Study ID number"
label variable ever_oc "Ever used oral contraceptives"
label define NY 0 "No" 1 "Yes"
label values ever_oc NY
label variable why_oc "Why first start using OCs?"
label define why_ocL 1 "Birth Control" 2 "Menstrual Cycle Regulation" 3 "Acne Control" 4 "Anemia" 5 "PMS" 6 "PCOS" 7 "Other"
label values why_oc why_ocL
label variable oc_why_other "Reason for starting OC use, if selected “other” for why_oc"
label variable age_oc "Age started using OCs"
label variable yrs_oc "How many years used OCs"
label variable curr_oc "Currently using OCs"
label define NYM 0 "No" 1 "Yes" 99 "Missing"
label values curr_oc NYM
label variable type_oc "Type of OC currently using"


*Check variable "age at first use of OCs" age_oc for issues*
tab age_oc, missing
summarize age_oc
*Make new variable "age_oc2" with clonevar*
clonevar age_oc2 = age_oc
*Supposed to be 12-27 but there is someone who said 28, set them as missing*
replace age_oc2=. if age_oc==28
*Having missing=99 skews mean to 45.31, set them to .*
replace age_oc2=. if age_oc==99
*Check work*
tab age_oc2, missing
summarize age_oc2


*Check variable "number of years used OCs" yrs_oc for issues*
tab yrs_oc, missing
summarize yrs_oc
*Make new variable "yrs_oc2" with clonevar*
clonevar yrs_oc2 = yrs_oc
*Supposed to be 0-11 but there are responses of 15, 21, and 25, set as missing*
replace yrs_oc2=. if yrs_oc==15
replace yrs_oc2=. if yrs_oc==21
replace yrs_oc2=. if yrs_oc==25
*Having missing=99 skews mean to 38.23, set them to .*
replace yrs_oc2=. if yrs_oc==99
*Check work*
tab yrs_oc2, missing
summarize yrs_oc2


*Create new variable from age_oc that groups participants into age first OC use: ≤15, 16, 17, 18, 19, ≥20*
gen agecat=.
replace agecat=1 if age_oc2<=15
replace agecat=2 if age_oc2>=15 & age_oc2<16
replace agecat=3 if age_oc2>=16 & age_oc2<17
replace agecat=4 if age_oc2>=17 & age_oc2<18
replace agecat=5 if age_oc2>=18 & age_oc2<19
replace agecat=6 if age_oc2>=19 & age_oc2<20
replace agecat=7 if age_oc2>=20 & age_oc2!=.

label variable agecat "Age in categories"
label define agecat1 1 "<=15 Years" 2 "15 Years" 3 "16 Years" 4 "17 Years" 5 "18 Years" 6 "19 Years" 7 ">=20 Years"
label values agecat agecat1

*check work*
tab agecat
bysort agecat: sum age_oc2


*cross-tabulate ever_oc with curr_oc*
tabulate ever_oc curr_oc, missing
*hard to tell groups appart/whos using when*

*Create a new variable "ocs"*
gen ocs=.
replace ocs=0 if ever_oc==0 & curr_oc==0 
replace ocs=1 if ever_oc==1 & curr_oc==0
replace ocs=2 if ever_oc==1 & curr_oc==1 
replace ocs=2 if ever_oc==0 & curr_oc==1

*label new variable*
label variable ocs "Oral Contraceptives History"
label define ocsL 0 "Never" 1 "Past" 2 "Current"
label values ocs ocsL

*check work*
tab ocs ever_oc, missing
tab ocs curr_oc, missing


*Create new variable for "type of OCs currently used"*
*tabulate values*
tab type_oc, missing
*group variations of "ortho tri cyclen"*
encode type_oc, generate(brand_kr)
labelbook brand_kr
gen ocbrand=brand_kr
replace ocbrand=1 if brand_kr==50
replace ocbrand=1 if brand_kr==57
replace ocbrand=1 if brand_kr==58
replace ocbrand=1 if brand_kr==62
replace ocbrand=1 if brand_kr==67
replace ocbrand=1 if brand_kr==94
*check work*
tab ocbrand
