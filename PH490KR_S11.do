*//Emily Lynch//*
*Created: March 1, 2018*
*Modified: March 1, 2018*
*Session 11-Relative Risk and Odds Ratio*

use "C:\Users\emilylynch\Downloads\VitDsess11.dta"

*Calculate RR alc use and PMS*
cs pmscc alc01
*People who drank alc had an increased risk of 3.8 times higher risk of PMS compared to people who did not drink alc*


*Calculate Odds Ratio for association btwn smoking and PMS*
cc pmscc smoke01
*Smokers had a 5.35 increased risk of PMS symptoms compared to non smokers*
*CI does not include 1 so it is significant*


*Calculate odds ratio for association btwn tertile of hours spent sitting*
tabodds pmscc sitq, or
*1=Refrant group* **none are stat significant, CI's are not greater than 1**
*Null Hypothesis: H0: OR(T1)=OR(T2)=OR(T3)   HA: >= 1 is different*


*Calculate odds ratio for association btwn smoking and PMS, adjusted for tertile hours sitting*
tabodds pmscc smoke01, adjust(sitq)


*Calculate the odds ratio for association btwn BMI and PMS*
cc pmscc bmi01
*Odds Ratio = 1.27...CI= 0.46-3.66 so not stat significant*


*Calculate odds ratio for association btwn smoking and PMS adjusted for weight*
*Compare to the unadjusted association btwn smoking and PMS. Is weight a confounder of the association?*
 tabodds pmscc smoke01, adjust(wt_med)
 *People who smoke have a 5.29 times increased risk of PMS symptoms compared to those who do not smoke, is significant bc of CI*
 *Compared to unadjusted, who had a 5.35 increased risk, and CI's that overlap, weight is not a confounder*
 
 
 *Calculate odds ration for association btwn tanning and PMS*
 tabodds pmscc tan_freqkr, or
 *People who tanned only once or twice had a 1.5 increased risk of PMS compared to those who tanned bi-monthly but CI makes this not significant*
 *People who never tanned had a 0.8 times lower risk of PMS compared to those who tanned bi-monthly, CI makes this not significant*
 
 