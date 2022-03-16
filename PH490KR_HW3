/******************************
This program runs steps needed for homework #3 

Emily Lynch
Due: March 5, 2018
******************************/



*Open dataset
use "/Users/emily_lynch21/Downloads/lowbwt490kr.dta"



*Assign an appropriate label to each variable
label variable id "Participant ID #"
label variable low "Case/Cntrl of Low birthwght"
label variable age "Moms age, years"
label variable race "Moms Race"
label variable smoke "Moms smoke status"
label variable ptl "Num times had premature labor"
label variable ht "Hypertension"
label variable ftv "Num of First Tri Dr Visit"

*Label the values of categorical variables as appropriate
label define Case_Control 0 "Normal wt (control)" 1 "Low wt (case)"
label values low Case_Control
label define Race 1 "White" 2 "Black" 3 "Other"
label values race Race
label define SmkStatus 0 "Non-Smoker" 1 "Smoker"
label values smoke SmkStatus
label define NY 0 "No" 1 "Yes"
label values ht NY

*Produce a list of the dataset contents using the “describe” command
describe



*Create new variable that groups women’s # of 1st trimester physician visits into the following categories: 0, 1, ≥2
gen ftv_cat=.
replace ftv_cat=0 if ftv==0
replace ftv_cat=1 if ftv==1
replace ftv_cat=2 if ftv>=2 & ftv!=.

*Label this new variable and its values
label variable ftv_cat "Categories of Num of First Tri Dr Visit"
label define ftv_catL 0 "0 Visits" 1 "1 Visit" 2 ">=2 Visits"
label values ftv_cat ftv_catL

*Check work
tab ftv_cat ftv



*Create new variable that represents whether or not women have a pre-existing “high risk” condition (either history of premature labor or hypertension) or not 
gen prext_cond=.
replace prext_cond=0 if ht==0 & ptl==0
replace prext_cond=1 if ht==1 & ptl==0
replace prext_cond=1 if ht==0 & ptl==1
replace prext_cond=1 if ht==1 & ptl==1

*Label this new variable and its values
label variable prext_cond "Pre-Existing Condition Status"
label define prext_condL 0 "No Pre-Existing Condition" 1 "Pre-Existing Condition"
label values prext_cond prext_condL

*Check work
tab prext_cond, missing



*Calculate the mean age of the participants in the study
sum age
*23.24

*Report overall mean and mean age among women w/ low birthweight baby and without a low birthweight baby
ttest age, by(low)
*Mean of mom's age normal weight baby: 23.66
*Mean of mom's age low weight baby: 22.31

*Test if there is a statistically significant difference in mean age
*CI of mom's age normal weight baby: 22.69-24.63
*CI of mom's age normal weight baby: 21.13-23.48
*CI does not include 1 and overlap, so it is significant



*Determine the distribution of race in the study population
tab race, missing

*Cross-tabulate participant race by whether or not the woman had low birthweight baby
tab low race

*Use a chi square test to determine if there is an association btwn race and low birthweight in this population. Interpret your results
tab race low, row col chi2
*I think it would depend on the number of races that made up "other" but it appears that white people are the only group with a higher ratio of normal vs low wt*
*I also think it is statistically significant because pr > 0.05 ... pr=0.082 



*Calculate the odds ratio to evaluate the relationship btwn race and low birthweight. Be sure to separately compare Blacks and Other races to Whites. Interpret your results.
gen race_cat=.
replace race_cat=1 if race ==1
replace race_cat=2 if race==2
replace race_cat=2 if race==3

label variable race_cat "Groups Race"
label define RaceL 1 "White" 2 "Black & Other"
label values race_cat RaceL

tabodds low race_cat, or
*Mothers who identified as black or other had a 2.004 times increased risk of having a baby with low birth weight compared to babies birth weight of Mother's who identified as white*

