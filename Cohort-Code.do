
use Dataset
keep if Vaccination==1
keep if Pfizer==1
gen Cohort=1 if Infection==1
replace Cohort=0 if Infection==0
label define Cohort 1"Prior infection" 0"No prior infection"
label values Cohort Cohort
drop if Mortality==1 & FPeriod==0 & Cohort==0
drop if Ab==1 & & FPeriod==0 & Cohort==0
drop if PCR==1 & & FPeriod==0 & Cohort==0
drop if Mortality==1 & FPeriod==0 & Cohort==1
ccmatch Sex Age Nationality calendarweek, cc(Cohort) id(id)
keep if match~=.
tab Mortality Cohort, col chi2
tab PCR Cohort, col chi2
ttest Age, by(Cohort)
tab AgeCat Cohort, col chi2
tab Sex Cohort, col chi2
tab Nationality, col chi2
gen time=eventtime-startdate
stset time, failure(event=1)
stptime
save Dataset1
use Dataset
keep if Vaccination==1
keep if Moderna==1
gen Cohort=1 if Infection==1
replace Cohort=0 if Infection==0
label define Cohort 1"Prior infection" 0"No prior infection"
label values Cohort Cohort
drop if Mortality==1 & FPeriod==0 & Cohort==0
drop if Ab==1 & & FPeriod==0 & Cohort==0
drop if PCR==1 & & FPeriod==0 & Cohort==0
drop if Mortality==1 & FPeriod==0 & Cohort==1
ccmatch Sex Age Nationality calendarweek, cc(Cohort) id(id)
keep if match~=.
tab Mortality Cohort, col chi2
tab PCR Cohort, col chi2
ttest Age, by(Cohort)
tab AgeCat Cohort, col chi2
tab Sex Cohort, col chi2
tab Nationality, col chi2
gen time=eventtime-startdate
stset time, failure(event=1)
stptime
save Dataset2