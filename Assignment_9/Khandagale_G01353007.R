###------------------
###Hypothesis Testing
###------------------

###Students Name: Deepti Vijay Khandagale
###GNumber: G01353007



getwd()
setwd("~/Documents/DiptiFolder/GMU_Spring_2022/Deepti_Github_Repo/AIT580/R_assignment_9")
library(dplyr)
library(ggplot2)
library(gplots)
rm(list=ls())

data <- read.csv('EmployeeAttrition.csv')
data
str(data)

# Your hypothesis testings here...
#Q.1: If the MonthlyIncome of Males is greater than Females

## Selecting Data needed for the T-test 
t_test_data = select(data , c( 'Gender' , 'MonthlyIncome' ))
print(t_test_data)

## Filtering male and Female dataframe
male = filter(t_test_data , Gender == 'Male')
female = filter(t_test_data , Gender == 'Female')
print(male)
print(female)

print(t.test(x = male$MonthlyIncome 
       , y = female$MonthlyIncome
       , paired= FALSE
       , alternative = c('greater')
       , conf.level = 0.95))

# As per the test, the p-value is greater than 0.05 i.e the null hypothesis is accepted means
# that there is no evidence to say that the monthly income of male is greater than female.

#Q.2 : If the WorkLifeBalance of Males is less than Females?

t_test_work = select(data , c( 'Gender' , 'WorkLifeBalance'))
print(t_test_work)

malework = filter(t_test_work, Gender=="Male")
femalework = filter(t_test_work, Gender == "Female")
print(malework)
print(femalework)

print(t.test(x = malework$WorkLifeBalance 
             , y = femalework$WorkLifeBalance
             , alternative = c('less')
             , paired= FALSE
             , conf.level = 0.95))

# As per the test, the p-value is greater than 0.05 i.e the null hypothesis is accepted
# that there is little evidence to say that the work life balance of male is less than female.

#Q.3 : If the YearsAtCompany of Single is less than Married 

t_test_years = select(data , c( 'MaritalStatus' , 'YearsAtCompany' ))
print(t_test_years)
Single = filter(t_test_years , MaritalStatus == 'Single')
Married = filter(t_test_years , MaritalStatus == 'Married')
print(Single)
print(Married)

print(t.test(x = Single$YearsAtCompany 
       , y = Married$YearsAtCompany
       , alternative = c("less")
       , paired= FALSE
       , conf.level = 0.95))

# As per the test, the p-value is less than 0.05 i.e the null hypothesis is rejected
# that means there is evidence to say that years at company of single of male is less than Married 


#Q.4 : If the EnvironmentalSatisfaction of Attrition=Yes is less than Attrition=No

t_test_env = select(data , c( 'Attrition' , 'EnvironmentSatisfaction' ))
print(t_test_env)
attr_yes = filter(t_test_env , Attrition == 'Yes')
attr_no = filter(t_test_env , Attrition == 'No')
print(attr_yes)
print(attr_no)

print(t.test(x = attr_yes$EnvironmentSatisfaction 
       , y = attr_no$EnvironmentSatisfaction
       , alternative = c("less")
       , paired= FALSE
       , conf.level = 0.95))

# As per the test, the p-value is less than 0.05 i.e the null hypothesis is rejected
# means that there is evidence to say EnvironmentalSatisfaction of Attrition=Yes is less than Attrition=No

#Q.5 : If the MonthlyIncome of Manager is greater than Laboratory Technician (Hint: Use
#JobRole to find Manager and Laboratory Technician) 

t_test_job = select(data , c( 'JobRole' , 'MonthlyIncome' ))
print(t_test_job)
manager = filter(t_test_job , JobRole == 'Manager')
lab = filter(t_test_job , JobRole == 'Sales Executive')
print(manager)
print(lab)

print(t.test(x = manager$MonthlyIncome 
             , y = lab$MonthlyIncome
             , alternative = c("greater")
             , paired= FALSE
             , conf.level = 0.95))

# As per the test, the p-value is much less than 0.05 i.e the null hypothesis is rejected
# that means there is more evidence to say that MonthlyIncome of Manager is greater than Laboratory Technician

#Q.6 : If YearsAtCompany and DailyRate are correlated with each other

lm_years <- lm(DailyRate~YearsAtCompany, data = data)
print(summary(lm_years))

#As per the linear model, p value is greater than 0.05 means the null hypothesis is accepted means 
# the daily rate does not have an impact on years at company

#Q.7. If YearsAtCompany and MonthlyIncome are correlated with each other 

lm_month <- lm(MonthlyIncome~YearsAtCompany, data = data)
print(summary(lm_month))

# As per the linear model, p value is less than 0.05 means the null hypothesis is accepted means
#with the 1 unit change in YearsAtCompany, monthly income will change by 395.2 units.

#Q.8. If YearsAtCompany varies depending on individual’s MaritalStatus

aov_comp = select(data , c( 'YearsAtCompany' , 'MaritalStatus'))
aov_comp$MaritalStatus <- as.factor(aov_comp$MaritalStatus)

print(summary(aov(YearsAtCompany ~ MaritalStatus, data=aov_comp)))

library(gplots)
print(plotmeans(YearsAtCompany ~ MaritalStatus, data=aov_comp
                , xlab="Years at Company",
                ylab="Marital Status"
                , main="Mean Plot\nwith 95% CI"))

# As per the test and plot, it can be said that the p value is less than 0.05 i.e the null hypothesis
# is accepted meaning Marital  have an impact on Years at company

#Q.9. If MonthlyIncome varies depending on individual’s PerformanceRating 

aov_month = select(data , c( 'PerformanceRating' , 'MonthlyIncome'))
print(aov_month)
aov_month$PerformanceRating <- as.factor(aov_month$PerformanceRating)

summary(aov(MonthlyIncome ~ PerformanceRating, data=aov_month))

print(plotmeans(MonthlyIncome ~ PerformanceRating, data=aov_month
          , xlab="PerformanceRating",
          ylab="MonthlyIncome"
          , main="Mean Plot\nwith 95% CI"))

# As per the test and plot, it can be said that the p value is greater than 0.05
# i.e null hypothesis accepted meaning PerformanceRating does not have impact on MonthlyIncome

#Q.10. If MonthlyIncome varies depending on individual’s WorkLifeBalance. 

aov_work = select(data , c( 'WorkLifeBalance' , 'MonthlyIncome'))
print(aov_work)
aov_work$WorkLifeBalance <- as.factor(aov_work$WorkLifeBalance)

print(summary(aov(MonthlyIncome ~ WorkLifeBalance, data=aov_work)))

print(plotmeans(MonthlyIncome ~ WorkLifeBalance, data=aov_work
                , xlab="WorkLifeBalance",
                ylab="MonthlyIncome"
                , main="Mean Plot\nwith 95% CI"))

# As per the test and plot, it can be said that the p value is greater than 0.05
# i.e null hypothesis is accepted meaning Work Life Balance does not have impact on MonthlyIncome

