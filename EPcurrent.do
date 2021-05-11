****Kwame Lambert*****
*****Empirical Project*****
***** ECO 480 ********
clear all
set more off
capture log close 
log using "Empirical", text replace
cd "C:\Users\kwame\Documents\#1 Spring 2020\ECO 480\Empirical Project\Data"
use "C:\Users\kwame\Documents\#1 Spring 2020\ECO 480\Empirical Project\Data\meps_senior.dta"

gen obese = bmi >= 30
gen overweight = bmi >= 25 & bmi <= 29.9
gen normal = bmi >= 18.5 & bmi <=  24.9
gen underweight = bmi <18.5

// Checking to see if there's any missing data \\
mdesc 
*No missing data*
// EXPENDITURE STATS \\
sum totalexp, detail
** Mean = 8,358.25, SD = 14,109.34, min = 1, max = 235,392
tab totalexp if totalexp <= 8358.25
tab totalexp if totalexp >= 70000
** n = 21
// Removing major outliers
sum totalexp if totalexp < 70000
tab totalexp if totalexp >= 70000 & bmi >= 25

// DESCRIPTIVE STATISTICS \\
tab underweight 
tab normal
tab overweight 
tab obese
** Total Number of respondents: n = 2,970 (100%)



// BMI DISTRIBUTION \\
sum bmi, detail
** Underweight = 60 (2.02%)
** Normal = 990 (33.33%)
** Overweight = 1,121 (37.74%)
** Obese = 799 (26.90%)
** Average BMI = 27.3 which is associated with being overweight
// GENDER DISTRIBUTION \\
tab male
tab male if obese
tab male if underweight
tab male if normal
tab male if overweight
histogram male, percent
// MALE BMI DISTRIBUTION \\

** Total Male = 1,218 (41.01%)
** Underweight = 15 (25%)
** Normal = 363 (36.67%)
** Overweight = 546 (48.71%)
** Obese = 294 (36.80%)

// FEMALE BMI DISTRIBUTION \\

** Total Female = 1,752 (58.99%)
** Underweight = 45 (75%)
** Normal = 627 (63.33%)
** Overweight = 575 (51.29%)
** Obese = 505 (63.2%)

// AGE DISTRIBUTION \\
sum age
sum age if obese
sum age if underweight
sum age if overweight
sum age if normal

** Average age = 74 years old
** Average age if underweight = 76 years old
** Average age if noraml = 75 years old
** Average age if overweight = 73 years old
** Average age if obese = 72 years old

// RACE DISTRIBUTION \\
gen white =  race_grp == 1
gen black =  race_grp == 2
gen oth_nonH =  race_grp == 3
gen hispanic =  race_grp == 4

tab obese if white
** White distribution
tab race_grp
sum race_grp if race_grp == 1
sum race_grp if race_grp == 1 & underweight
sum race_grp if race_grp == 1 & normal
sum race_grp if race_grp == 1 & overweight
sum race_grp if race_grp == 1 & obese

** Black Distribution
sum race_grp if race_grp == 2
sum race_grp if race_grp == 2 & underweight
sum race_grp if race_grp == 2 & normal
sum race_grp if race_grp == 2 & overweight
sum race_grp if race_grp == 2 & obese

** Other/Non-Hispanic
sum race_grp if race_grp == 3
sum race_grp if race_grp == 3 & underweight
sum race_grp if race_grp == 3 & normal
sum race_grp if race_grp == 3 & overweight
sum race_grp if race_grp == 3 & obese

** Hispanic
sum race_grp if race_grp == 4
sum race_grp if race_grp == 4 & underweight
sum race_grp if race_grp == 4 & normal
sum race_grp if race_grp == 4 & overweight
sum race_grp if race_grp == 4 & obese

** Total White = 2,129: Underweight = 44, Normal = 756, Overweight = 808, Obese = 521

** Total Black = 381: Underweight = 5, Normal = 96, Overweight = 139, Obese = 141

** Total Other/ Non-Hispanic = 133: Underweight = 6, Normal = 58, Overweight = 43, Obese = 26

** Total Hispanic = 327:  Underweight = 5, Normal = 80, Overweight = 131, Obese = 111

// INCOME DISTRIBUTION \\

tab income if income <= 22938
**1931 people make less than average
sum income if underweight
sum income if normal
sum income if overweight
sum income if obese
** Average income = $22,938.29
** Average income if underweight = 	$16,588
** Average income if normal =  $23,837
** Average income if overweight = $23,832
** Average income if obese = $20,057


// COMORBIDITIES \\

** High Blood Pressure
tab high_bp
tab high_bp if underweight
tab high_bp if normal
tab high_bp if overweight
tab high_bp if obese

** Total High Blood Pressure  = 1,991 (67.04%)
** Underweight = 29 (48.3%)
** Normal = 570 (57%)
** Overweight = 747 (66.6%)
** Obese = 645 (80.73%)

**High Cholesterol
tab high_chol
tab high_chol if underweight
tab high_chol if normal
tab high_chol if overweight
tab high_chol if obese

** Total High Cholesterol = 1,565 (52.69%)
** Underweight = 23 (38.3%)
** Normal = 473 (47.78%)
** Overweight = 609 (54.3%)
** Obese = 460 (57.57%)

** Diabetes
tab diabetes
tab diabetes if underweight
tab diabetes if normal
tab diabetes if overweight
tab diabetes if obese

** Total Diabetes = 613 (20.64%)
** Underweight = 4 (6.67%)
** Normal = 118 (11.92%)
** Overweight = 229 (20.43%)
** Obese = 262 (32.79%)

** Chronic Heart Disease
tab chd
tab chd if underweight
tab chd if normal
tab chd if overweight
tab chd if obese

** Total Chronic Heart Disease = 381 (12.83%)
** Underweight = 11 (18.3%)
** Normal = 109 (11.01%)
** Overweight = 154 (13.74%)
** Obese = 107 (13.39%)

**Physical Limits
tab phy_lim
tab phy_lim if underweight
tab phy_lim if normal
tab phy_lim if overweight
tab phy_lim if obese

**Total Physical Limits = 1,131 (38.08%)
** Underweight = 28 (46.67%)
** Normal = 340 (34.34%)
** Overweight = 370 (33.01%)
** Obese = 393 (49.19%)

** Self Reported Health
tab srhealth
tab srhealth if underweight
tab srhealth if normal
tab srhealth if overweight
tab srhealth if obese

** Total Self Reported Health Status: Excellent = 457 (15.39%), Very Good = 780 (26.26%), Good = 951 (32%), Fair = 544 (18.32%), Poor = 238 (8.01%)

** Underweight: Excellent = 5 (8.33%), Very Good = 15 (25%), Good = 15 (25%), Fair = 18 (30.00%), Poor = 7 (11.67%)

** Normal: Excellent = 200 (20.2%), Very Good = 293 (29.6%), Good = 268 (27.07%), Fair = 158 (15.96%), Poor = 71 (7.17%)

** Overweight: Excellent = 194 (17.31%), Very Good = 299 (26.67%), Good = 368 (32.83%), Fair = 178 (15.88%), Poor = 82 (7.31%)

** Obese: Excellent = 58 (7.26%), Very Good = 173 (21.65%), Good = 300 (37.55%), Fair = 190 (23.78%), Poor = 78 (9.76%)

** Self Reported Mental Health Status
tab mntl_hlth
tab mntl_hlth if underweight
tab mntl_hlth if normal
tab mntl_hlth if overweight
tab mntl_hlth if obese

** Total Self Reported Mental Health: Excellent = 663 (22.32%), Very Good = 918 (30.91%), Good = 1,023 (34.44%), Fair = 273 (9.19%), Poor = 93 (3.13%)

** Underweight: Excellent = 7 (11.67%), Very Good = 13 (21.67%), Good = 28 (46.67%), Fair = 9 (15.00%), Poor = 3 (5.00%)

** Normal: Excellent = 213 (21.52%), Very Good = 336 (33.94%), Good = 305 (30.81%), Fair = 97 (9.80%), Poor = 39 (3.94%)

** Overweight: Excellent = 268 (23.91%), Very Good = 350 (31.22%), Good = 385 (34.34%), Fair = 86 (7.67%), Poor = 32 (2.85%)

** Obese: Excellent = 175 (21.9%), Very Good = 219 (27.41%), Good = 305 (38.17%), Fair = 81 (10.14%), Poor = 19 (2.38%)

**Number of Doctor Visits
sum dr_visits
sum dr_visits if underweight
sum dr_visits if normal
sum dr_visits if overweight
sum dr_visits if obese

** Total Average Number of Docotor Visits = 10
** Average Underweight Doctor Visits = 8
** Average Normal Docotr Visits = 10
** Average Overweight Docotor Visits= 10
** Average Obese Doctor Visits = 11

** Number of Hospital Visits
tab hosp_vis
tab hosp_vis if underweight
tab hosp_vis if normal
tab hosp_vis if overweight
sum hosp_vis if obese
 
** Total Underweight Hospital Visits =  60
** Total Normal Hospital Visits = 990
** Total Overweight Hospital Visits = 1,121
** Total Obese Hospital Visits = 799


*all individuals are already elderly (65+)
*The average bmi for the elderly is 27.37 which is classified as overweight according to the bmi chart

// EDUCATION
gen highschool = edu == 12
gen some_col = edu > 12 & edu <16
gen college = edu == 16

//MARITAL
gen married = marital == 1
gen widowed = marital == 2
gen div_sep = marital == 3
gen nev_mar = marital == 4

//SUM STATS
summarize


histogram totalexp
//Distribution skewed right: going to log to make distribution closer to normal


gen lntotalexp = ln(totalexp)
histogram lntotalexp 
**Distribution appears closer to normal


// Regressions
gen age2 = age *age
gen bmi2 = bmi*bmi
gen lnbmi = ln(bmi)
reg lntotalexp bmi
reg lntotalexp bmi obese normal  

//Checking each regressions coefficient individually
reg lntotalexp obese
reg lntotalexp normal
reg lntotalexp underweight
reg lntotalexp overweight

gen morbid12 = high_bp | high_chol | chd | diabetes

// Potential Economic models,,,, Robust
reg totalexp bmi  i.obese##c.diabetes age i.obese##i.high_bp i.chd##i.high_chol race_grp i.phy_lim##i.chd dr_visits hosp_vis


reg lntotalexp normal  diabetes age male i.obese##i.high_bp i.chd##i.high_chol race_grp i.phy_lim##i.chd i.normal##c.dr_visits i.normal##c.hosp_vis 

gen visits = dr_visits | hosp_vis


//////FINAL ESTIMATION
gen inc_visits = income*visits
gen morb_visits = morbid12 * visits
gen phylim_visits = phy_lim*visits


** Equation (1)
reg lntotalexp bmi obese overweight 

//model equation (2)
reg lntotalexp bmi obese age visits morbid12 income phy_lim inc_visits morb_visits phylim_visits male white married, robust
test white male

****************************************************************************
//hypothetical
reg lntotalexp bmi obese age hosp_vis dr_visits high_bp high_chol chd diabetes income phy_lim inc_visits morb_visits phylim_visits male white married, robust
************************************************************



** Equation (3) Demographics
reg lntotalexp bmi age i.male##i.white black i.msa##c.income 


** Equation (4) Health conditions

reg lntotalexp obese overweight phy_lim visits high_bp high_chol chd diabetes



log cl





