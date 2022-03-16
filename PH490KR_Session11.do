/*************************************
This program runs session 11, 
ph490kr spring 2018

Calculating OR/RR in Stata

Emily Lynch
February 8, 2018
*************************************/

*open dataset
use "C:\Users\emilylynch\Downloads\VitDsess11.dta", clear

*FIND OR/RR FROM DROP-DOWNS: Statistics-->Tables for Epidemiologists  then select COhort study risk ratio or Case control odds ratio

*1. CALCULATE RR FOR ALCOHOL AND PMS
cs pmscc alc01
/*The risk of PMS is nearly 4 times (RR 3.8, 95% CI 0.6-23.6) higher among those who drink alcohol compared to 
those who do not, though this was not statistically significant.*/

*2. CALCULATE OR FOR SMOKING AND PMS
cc pmscc smoke01
/*There is a statistically significant 5-times increase in odds of PMS among smokers compared to non-smokers (OR 5.3, 95% CI 1.8-19.2).*/

/*alternative approach and to calculate adjusted ORs, use "tabsodds"
Statistics > Epidemiology and related > Tables for epidemiologists >
        Tabulate odds of failure by category
*/

*3. CALCULATE OR FOR TERTILES OF SITTING AND PMS
tabodds pmscc sitq, or
/*There is not a statistically significant association between time spent sitting
and PMS (OR 0.63, 95% CI 0.2-1.6 for tertile 3 vs tertile 1; OR 0.81, 95% CI 0.3-2.0).*/

*4. CALCULATE OR FOR SMOKING ADJUSTED FOR SITTING
tabodds pmscc smoke01, adj(sitq)
/*There is a statistically significant 5-times increase in odds of PMS among smokers compared to non-smokers, adjusted 
for time spent sitting (OR 5.9, 95% CI 1.9-18.4).*/

*5. CALCULATE OR FOR BMI AND PMS
cc pmscc bmi01
/*There is not a statistically significant association between BMI and PMS (OR 1.3, 95% CI 0.5-3.6)*/

*6. CALCULATE OR FOR SMOKING AND PMS, ADJUSTED FOR WEIGHT
tabodds pmscc smoke01, adjust(wt_med) or
/*There is a statistically significant 5-fold increase in PMS associated with smoking, adjusted 
for weight (OR 5.3, 95% CI 1.8-15.9*/

/*compare to undadjusted above: 5.29 (adj) vs 5.35 (unadj)
weight does not confound the relationship between smoking
and PMS */

*7. CALCULATE OR FOR TANNING AND PMS
tabodds pmscc tan_freqkr, or
/*There is no statistically significant association between tanning and PMS: OR for never tanners vs those who 
tan at least bimonthly 0.8, 95% CI 0.3-2.5; OR for those who've tanned once or twice vs those who tan at least
bimonthly 1.5, 95% CI 0.3-9.0.*/

*8. CALCULATE OR FOR ALCOHOL USE AND PMS, DETERMINE IF SMOKING IS A CONFOUNDER
tabodds pmscc alc01, or
tabodds pmscc alc01, adj(smoke01) or

/*ORadj=5.62, ORunadj=7.14; smoking appears to be a confounder of the association
between alcohol use and PMS*/


