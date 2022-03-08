/*******************************
THIS PROGRAM PRODUCES KEY
TO PH490KR GROUP PROJECT 


ORIGINAL: APRIL 29, 2018
********************************/

*START A LOG FILE
log using "/Users/Thao/Downloads/490KRST.smcl"

use "/Users/Thao/Downloads/490KRGROUPPROJ.dta""
*1. LABEL EACH VARIABLE AND VALUES
*easy to use variables manager and then paste code below

drop Timestamp

rename Age age
rename Gender gender 
rename EthnicityOriginorRace ethn_race
rename EmploymentStatusAreyoucurre employ
rename Doyouhaveanaccountonanyso socmed
rename Doyouconsideryourselfanavid socmed_user
rename Howoftendoyoucheckthefollo howoften_fb
rename I howoften_tw
rename J howoften_inst
rename K howoften_link
rename L howoften_snap
rename M howoften_pin
rename N howoften_vsco
rename O howoften_red
rename P howoften_tum
rename Onaveragehowmanyhoursdoyou smpday
rename Whatdoyounormallyusesocial sm_purp
rename Doyouthinkthatsocialmediah smbimage
rename Hassocialmediaevermadeyouw sm_app
rename Doyouliketheideaoftanning tan_idea
rename Haveyouevergoneordoyoucu tanever
rename Notincludingsprayontansdur tan_year
rename Doyouknowanyonewhohasgone tanfriend
rename Howwouldyourateyourskintyp fitzskin
rename Whichdoyouthinkismorelikel cancer_cause
rename Wheredoyouprefertogoindoor indoor
rename Doyouconsideryourselfmoreat att_tan
rename Doyouthinkthattanningishar harm_tan
rename Haveyoueverbeeneducatedabou ed_tan
rename Doyoueverworryaboutgetting tan_can
rename Doyouknowsomeonewhohasdied died_sc
rename Doyoubelieveitwouldbehard stop_tan


label variable age "age: Age"
label variable gender "gender: Gender"
label variable ethn_race "ethn_race: Ethnicity/ Origin (race)"
label variable employ "employ: Employment status"
label variable socmed "socmed: Has an account on any social media site"
label variable socmed_user "socmed_user: Do you consider yourself an avid social media user?"
label variable howoften_fb "howoften_fb: How often do you use Facebook?"
label variable howoften_tw "howoften_tw: How often do you use Twitter?"
label variable howoften_inst "howoften_insta: How often do you use Instagram?"
label variable howoften_link "howoften_link: How often do you use LinkedIn?"
label variable howoften_snap "howoften_snap: How often do you use Snapchat?"
label variable howoften_pin "howoften_pin: How often do you use Pinterest?"
label variable howoften_vsco "howoften_vsco: How often do you use VSCO?"
label variable howoften_red "howoften_red: How often do you use Reddit?"
label variable howoften_tum "howoften_tum: How often do you use Tumblr?"
label variable smpday "smpday: How often do you use social media per day?"
label variable sm_purp "sm_purp: Purpose of social media"
label variable smbimage "smbimage: Effect of social media on body image "
label variable sm_app "sm_app: Does social media make you want to change your appearance?"
label variable tan_idea "tan_idea: Do you like the idea of tanning?"
label variable tanever "tanever: Have you ever gone, or do you currently, go tanning?"
label variable tan_year "tan_year: Not including spray-on tans, during the past 12 months, how many times have you used an indoor tanning device such as a sunlamp, tanning bed, or booth?"
label variable tanfriend "tanfriend: Do you know anyone who has gone indoor tanning in the past 12 months?"
label variable fitzskin "fitzskin: How would you rate your skin type on the Fitzpatrick Skin Type Scale"
label variable cancer_cause "cancer_cause: Which do you think is more likely to cause skin cancer?"
label variable indoor "indoor: Where do you prefer to go indoor tanning?"
label variable att_tan "att_tan: Do you consider yourself more attractive when you are tan?"
label variable harm_tan "harm_tan: Do you think that tanning is harmful?"
label variable ed_tan "ed_tan: Have you ever been educated about tanning beds? (In school, watching a commercial, hearing a speaker, reading about it online, etc )"
label variable tan_can "tan_can: Do you ever worry about getting skin cancer?"
label variable died_sc "died_sc: Do you know someone who has died from skin cancer?"
label variable stop_tan "stop_tan: Do you believe it would be hard for you to stop tanning? (Indoors or outdoors) "



label define genderf 1 "1_Female" 2 "2_Male" 3 "3_Prefer not to answer"
label define racef 1 "1_White" 2 "2_Hispanic or Latino" 3 "3_Black or African American" 4 "4_Native American or Native Indian" 5 "5_Asian/Pacific Islander" 6 "6_Other"
label define workf 1 "1_Working part time" 2 "2_Working full time" 3 "3_Student(full or part time)" 4 "4_Not working"
label define ynf 0 "0_Yes" 1 "1_No" 
label define usef 1 "1_Mutiple Times per day" 2 "2_Daily" 3 "3_Multiple Times per Week" 4 "4_Weekly" 5 "5_Bi-Weekly" 6 "6_Monthly" 7 "7_Never/Don’t have an account"
label define hourf  1 "0_ 0 hours" 2 "2_1-2 hours" 3 "3_3-4 hours" 4 "4_3-5+ hours"
label define purposef 1 "1_Stay in touch with family/friends" 2 "2_Stay up-to-date on current events/news" 3 "3_Share photos/videos with friends" 4 "4_ Fill spare time" 5 "5_Find entertaining content" 6 "6_General networking/making friends/meet new people" 7 "7_Create new posts/share opinion" 8 "8_Other"
label define viewf 1 "1_Negative" 2 "2_Positive" 3 "3_Indifferent" 
label define ynf1 0 "0_Yes" 1 "1_No" 2 "2_Maybe" 
label define ynf2 0 "0_Yes" 1 "1_No" 2 "2_Indifferent" 
label define timesf 1 "1_more than once a week" 2 "2_weekly" 3 "3_bi-weekly(every two weeks)" 4 "4_monthly" 5 "5_bi-monthly(every two months) 6 "6_only once or twice" 
7 "7_never" 
label define ynf3 0 "0_Yes" 1 "1_No" 2 "2_Not sure" 
label define ynf4 0 "0_Yes" 1 "1_No" 2 "2_Unsure " 
label define scalef  1 "1_Type | - Ivory " 2 "2_Type || - Beige" 3 "3_Type ||| - Light Brown" 4 "4_Type |V - Medium Brown" 5 "5_Type V - Dark Brown" 6 "6_ Type V| - very Dark Brown"
label define skinf 1 "1_The Sun" 2 "2_Tanning Beds" 3 "3_I think they both cause skin cancer" 4 "4_I don't think either cause skin cancer" 
label define tanf 1 "1_Tanning Salon" 2 "2_Gym" 3 "3_Private bed/booth" 4 "4_I do not tan indoors, I outdoor tan" 5 "5_Other"
label define harmf  1 "1_Never" 2 "2_Rarely" 3 "3_Sometimes" 4 "4_Most of the time" 5 "5_Always"
label define cancerf 1 "1_Frequently" 2 "2_Sometimes" 3 "3_I try not to think about it" 4 "4_I don't think that I will get skin cancer" 5 "5_No opinion"


label values gender genderf
label values ethn_race racef 
label values empoly workf
label values socmed ynf 
label values socmed_user ynf
label values howoften_fb usef
label values howoften_tw usef
label values howoften_inst usef
label values howoften_link usef
label values howoften_snap usef
label values howoften_pin usef
label values howoften_vsco usef
label values howoften_red usef
label values howoften_tum usef
label define smpday hourf
label values sm_purp purposef 
label values smbimage viewf
label values sm_app ynf1 
label values tan_idea ynf2
label values tanever ynf
label values tan_year timesf
label values fitzskin scalef
label values cancer_cause skinf
label values indoor tanf
label values att_tan ynf3 
label values harm_tan harmf
label values ed_tan ynf4
label values tan_can cancerf
label values died_sc ynf1
label values stop_tan ynf1

