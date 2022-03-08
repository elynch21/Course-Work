************************
Program for Exam 1

Emily Lynch
Created: March 8, 2018
************************

*Open data set*
use "C:\Users\emilylynch\Downloads\FramHrtEx1.dta"


*Label variables and values*
label variable cursmoke "cursmoke: current cigarette smoking"
label define cursmokestus 0 "No" 1 "Yes"
label values cursmoke cursmokestus
label variable bmi "bmi: Body Mass Index, kg/m2"
label variable stroke "stroke: Incident of stroke"
label define StrokehistNY 0 "No" 1 "Yes"
label values stroke StrokehistNY

GOOD, BUT BEST PRACTICE IS TO INCLUDE THE VALUE WITHIN ITS LABEL (-1)


*Check variable bmi for errors/problems*
sum bmi, d
*Having missing as 999 is effecting the percentiles and the mean*
*Need to create a new variable to eliminate this issue*
clonevar bmi2 = bmi
replace bmi2=. if bmi==999
*check new variable*
sum bmi2, d
*now min bmi=14.43 and max bmi=56.8, which both seem extreme*
tab bmi2
*however, looking over all values it does not look like these numbers are errors/typos because there are many other values leading to them in the mid teens/mid fiftys*
GOOD, BUT BEST CHECK OF YOU WORK COMPARES NEW TO ORIGINAL VARIABLES (-1)

*create new variable cardio*
gen cardio=.
replace cardio=1 if hospmi==1 | stroke==1
replace cardio=0 if hospmi==0 & stroke==0
*label*
label variable cardio "cardio: ever had cardio dis, hrt att or stoke"
label define cardioever 1 "Yes CD" 0 "No CD"
label values cardio cardioever
*check*
tab cardio, missing
*all 11,627 observations are accounted for*
GOOD, BUT BEST CHECK OF YOU WORK COMPARES NEW TO ORIGINAL VARIABLES (-1)


*calculate descriptive stats for bmi and cardio, interpret results*

sum bmi2 cardio, d
*gives you the mean for bmi2=25.88, but since cardio is categorical this does not apply*

tab cardio, missing
*give us that 82.58% of people in the study did not have a history of cardiovascular dis, and 17.42% did have a history of CD*

tabulate cardio, summarize(bmi2)
*gives you the mean bmi for someone without a history of cardiovascular dis=25.73, and mean bmi for someone with a history of cardiovascular dis=26.57*
*Std Dev for someone without a history of cardiovascular dis=4.03 and Std Dev for someone with a history of cardiovascular dis=4.37*

ttest bmi2, by(cardio)
*similar to above, gives you the same numbers for mean and std dev, gives the CI's of No CD= 25.65-25.81 and Yes CD=26.38-26.76*
*the p value comes out to 0.00 which is less than 0.05 and the CI's overlap with eachother therefore there is statistical significance*

NOTE THAT THE CIs DO NOT OVERLAP, WHICH IS EVIDENCE OF STATISTICAL SIGNIFICANCE (IF P<0.05 THEN THE 95% CIs WILL NOT OVERLAP)

tabodds cardio bmi2
*gives you p=0.0004 which is less then 0.05 therefore statistically significant*
NOT SURE WHAT THIS IS, ABOVE T TEST WAS CORRECT

*after reading number 6 I realized I somewhat combined 5&6*


GRADE ON PART 2: 57/60
