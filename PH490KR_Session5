/**********************************
THIS PROGRAM RUNS STEPS TO COMPLETE
PH490KR, SESSION 5, SPRING 2018

EMILY LYNCH
ORIGINAL: FEB 5, 2018
MODIFIED: FEB 9, 2018
***********************************/

*5.OPEN DATASET
cd "Z:\Emily's Docs\Courses\Pubhlth 490kr\Datasets"

use VitDsmk.dta
*6.VIEW DATASET AND CONTENTS
describe

*7.LABEL VARIABLES USING VARIABLES MANAGER, PASTE COMMANDS HERE
label variable id "id: study id"
label variable ev_smk "ev_smk: Ever smoked 20+ packs cigs"
label variable cur_smk "cur_smk: currently smoke"
label variable brand "brand: Brand of cigarettes"
label variable cig_day "cig_day: Num cigs per day"
label variable age_cig "age_cig: Age 1st smoked"
label variable age_qt "age_qt: Age quit smoking"

*8.LABEL VALUES USING VARIABLE MANAGER, PASTE COMMANDS HERE
label define ynf 0 "0_No" 1 "1_Yes"
label define cig_dayf 1 "1_1-10" 2 "2_11-20" 3 "3_21-30" 4 "4_31-40" 5 "5_41+" 99 "99_Missing"
label values ev_smk ynf
label values cur_smk ynf
label values cig_day cig_dayf

*9.LOOK AT "BRAND" VARIABLE
tabulate brand

*create a new variable that is numeric with the labels derived from the original text variable
encode brand, generate(brand_kr)
*see what brand each number corresponds to
labelbook brand_kr

*group similar brands together
gen cigbrand=brand_kr
replace cigbrand=1 if brand_kr==1 /*American Spirit yellow*/
replace cigbrand=1 if brand_kr==2 /*American Spirit lights*/
replace cigbrand=1 if brand_kr==3 /*American Spirit Medium*/

replace cigbrand=6 if brand_kr>=6 & brand_kr<=11 /*Marlboro*/

replace cigbrand=13 if brand_kr==14

*label the new variable
label values cigbrand brand_kr
*check our work
tabulate brand_kr cigbrand, missing

*10. VIEW ALL THE LABELS WE WROTE
labelbook

*11. DESCRIBE DATA USING CODEBOOK
codebook

*12. SAVE DATASET, TAKING CARE NOT TO OVERWRITE OUR ORIGINAL DATA
save "VitDsmk_working.dta", replace
