/**********************************
THIS PROGRAM RUNS STEPS TO COMPLETE
PH490KR, SESSION 6, SPRING 2018

EMILY LYNCH
ORIGINAL: FEB 1, 2018
MODIFIED: FEB 7, 2018
***********************************/

*1.START LOG
log using "Z:\Emily's Docs\Courses\Pubhlth 490kr\Spring 2018\Sessions\Session6_Errors\ph490kr_sess6_020118.smcl"

*2.OPEN DATASET, USE THE VERSION WE SAVED AFTER LABELING IN SESSION 5 (OR OPEN ORIGINAL DATASET AND RUN YOUR DO FILE FROM SESSION 5 TO LABEL
use "Z:\Emily's Docs\Courses\Pubhlth 490kr\Datasets\VitDsmk_working.dta"

*3.CROSS-TAB OF EV_SMK AND CUR_SMK
tab ev_smk cur_smk, miss

*4. CALCULATE MEAN AND RANGE FOR AGE_CIG
sum age_cig, detail
*4.b. cross-tab with ev_smk
tab age_cig ev_smk, miss

*fix? best to set to missing
clonevar age_cigkr=age_cig
replace age_cigkr=.a if age_cig==99
replace age_cigkr=.a if age_cig==0

*alternate approach using "recode"
recode age_cigkr 0=.a 99=.a

label define age_cigf .a ".a:Not applicable", add
label values age_cigkr age_cigf

sum age_cigkr
tab age_cigkr ev_smk, miss

*5. CALCULATE MEAN AND RANGE FOR AGE_QT
sum age_qt, d
*b. cross-tab with cur_smk
tab age_qt cur_smk, miss

*fix? set to missing and label appropriately, depending on current smk status
clonevar age_qtkr=age_qt
replace age_qtkr=.a if age_qt==99 & ev_smk==0 /*never smokers, set to missing*/
replace age_qtkr=.a if age_qt==0 & ev_smk==0 /*never smokers, set to missing*/

replace age_qtkr=.b if age_qt==99 & cur_smk==1 /*current smokers, set to missing since have not quit*/
replace age_qtkr=.b if age_qt==0 & cur_smk==1 /*current smokers, set to missing since have not quit*/

/*note that 2 current smokers listed an age at quitting--how should we
handle this? possible options: 1) set to missing, since we really want to know
about successful quitting; 2) keep as valid responses, since may represent a
period of time when they had quit, but decided to start again. 
Either approach is ok as long as the decision/rule is applied consistently
and is well-documented*/

replace age_qtkr=.b if cur_smk==1


label define age_qtf .a ".a:Non-smoker" .b ".b:Current smoker", add
label values age_qtkr age_qtf
tab age_qtkr cur_smk, miss

*6. CALCULATE MEAN AND RANGE OF CIG_DAY
sum cig_day, d
*1.b. cross-tab with cur_smk
tab cig_day cur_smk, miss

/*fix? we can infer that non-smokers/former smokers smoke 0 cigs/day
alternatively could set to missing*/
clonevar cig_daykr=cig_day /*note: clonevar keeps formatting*/
replace cig_daykr=0 if cig_day==99
sum cig_daykr


*7. SAVE DATASET, OK TO REPLACE OUR WORKING COPY
save "Z:\Emily's Docs\Courses\Pubhlth 490kr\Datasets\VitDsmk_working.dta", replace
