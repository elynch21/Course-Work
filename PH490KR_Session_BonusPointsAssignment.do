/******************************
This program runs steps for the 
Bonus Points assignment 

Emily Lynch
Due: March 23, 2018
******************************/


*Open dataset
use "/Users/emily_lynch21/Downloads/Bonus.dta"


*1. Label each variable and its values.
label variable age "Subject age in years"
label variable totchol "Total Cholesterol (mg/dL)"
label variable cursmoke "Current smoking status"
label variable bmi "Body Mass Index (kg/m2)"
label define smk_status 0 "Not a current smoker" 1 "Current smoker"
label define BMI_cat 0 "Normal" 1 "Overweight" 2 "Obese"
label values cursmoke smk_status
label values bmi BMI_cat


*2. Calculate appropriate descriptive statistics for each variable. Interpret your results.
sum totchol age, detail
*Upon looking into cholesterol ranges (below 200 mg/dL being desirable, and over 240 mg/dL being high
*there is a definitely an issue as the max value is 696 and the +90% of data ranges from 293-696
*The age ranges however seem normal and do not seem like there are any errors
tab bmi, missing
tab cursmoke, missing
tab cursmoke bmi, missing
*there are 19 people missing from bmi, overall the rest of the data seems normal.


*3 Test if the mean age is different between smokers and non-smokers. Interpret your results.
ttest age, by (cursmoke)
*The CIs do not overlap so there is evidence of statistical signficance, additionally p is <0.05

*4. Test if the mean total cholesterol is different between normal and overweight/obese individuals. (HINT: you may need to recode a variable to answer this question correctly).
gen weight_cat=.
replace weight_cat=0 if bmi==0
replace weight_cat=1 if bmi==1 
replace weight_cat=1 if bmi==2

label variable weight_cat "Weight Groups Norm vs Overweight/Obese"
label define Weight_catLabel 0 "Normal Weight" 1 "Overweight/Obese"
label values weight_cat Weight_catLabel

*check*
tab weight_cat, missing
tab bmi, missing
*both still have 19 missing and the numbers for each category add up correctly*

ttest totchol, by(weight_cat)
*the mean total cholesterol is different btwn the two groups, the CI's don't overlap and p is <0.05 so there is evidence of statistical signficance


*5. Calculate the odds ratio for smoking separately comparing overweight to normal and obese to normal
tabodds cursmoke bmi, or
*Normal BMI is the refrence group and there are more curent smokers that are overweight than there are curent smokers who are obese
*the CI's don't overlap and p is <0.05 so there is evidence of statistical signficance

