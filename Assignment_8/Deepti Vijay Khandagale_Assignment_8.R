######## AIT 580 – Assignment 8 – R Data Analysis #######

setwd("~/Documents/DiptiFolder/GMU_Spring_2022/AIT580_Big_data_to_information /Assignments/Assignment_8")

####### PART 1 #######

employee <- read.csv("EmployeeAttrition.csv")
library(dplyr)
library(ggplot2)

##1 Find the number of rows and columns in the dataset
print(dim(employee))

#row = 1470 and columns = 35

##2 Find the maximum Age in the dataset 
print(max(employee$Age))

##3 Find the minimum DailyRate in the dataset
print(min(employee$DailyRate))

##4 Find the average/mean MontlyIncome in the dataset
print(mean(employee$MonthlyIncome))

##5 How many employees rated WorkLifeBalance as 1
print(sum(employee$WorkLifeBalance =="1"))

##6 What percent of total employees have TotalWorkingYears less than equal to 5? 
#Also calculate the percentage for TotalWorkingYears greater than 5
Total <- sum(employee$EmployeeCount)
Less <- sum(employee$TotalWorkingYears<= "5")
Grt <- sum(employee$TotalWorkingYears> "5")
print(Total)
print(Less)
print(Grt)

# Percentage of total employees having TotalWorkingYears less than equal to 5
print((Less/Total)*100)

# Percentage of total employees having TotalWorkingYears greater than 5
print((Grt/Total)*100)

##7 Print EmployeeNumber, Department and MaritalStatus for those employees whose 
# Attrition is Yes and RelationshipSatisfaction is 1 and YearsSinceLastPromotion
# is greater than 3
filteremployee <- filter(employee, Attrition =="Yes" & RelationshipSatisfaction == 1 
                         & YearsSinceLastPromotion > 3 )
employeecond <- select(filteremployee, EmployeeNumber, Department, MaritalStatus)
print(employeecond)

##8 Find the mean, median, mode, standard deviation and frequency distribution of
# EnvironmentSatisfaction for males and females separately. 
# (Hint: For frequency distribution use table() function

#mean
dfmean<- employee %>% group_by(Gender) %>%
  summarise(mean_emp = mean(EnvironmentSatisfaction))
print(dfmean)

#median
dfmedian<- employee %>% group_by(Gender) %>%
  summarise(median_emp = median(EnvironmentSatisfaction))
print(dfmedian)

#mode
df <- select(employee, Gender, EnvironmentSatisfaction)
mode <- function(x) { names(which.max(table(x))) }
emp <- df %>% group_by(Gender) %>% summarise(mode=mode(EnvironmentSatisfaction))
print(emp)

#standard deviation
dfsd <- df %>% group_by(Gender) %>%
  summarise_each(funs(sd))
print(dfsd)

#Frequency distribution
print(table(df))

################################ PART 2 ####################################

acme <- read.csv("Acme.csv")

##1 Identify data types for each attribute in the dataset
print(str(acme))

##2 Produce a summary statistic for each attribute in the dataset
print(summary(acme))

##3 Produce visualizations for each attribute
#Years
Y <- hist(acme$Years)

#StartingSalary
S <- hist(acme$StSalary)

#Gender
G <- ggplot(acme, aes(x=(Gender))) + geom_bar()
print(G)

#Degree
D <- ggplot(acme, aes(x=Degree)) + geom_bar()
print(D)

##4 Display the relationship between
#a. Years of Experience and Starting Salary for all employees 

print(ggplot(acme, aes(x=Years, y=StSalary)) + geom_point())

#b. Years of Experience and Starting Salary for each gender 

print(ggplot(acme, aes(x=Years, y=StSalary, colour = Gender)) + geom_point())

#c. Years of Experience and Starting Salary for each degree 
#(Hint: use Scatter Plots)

print(ggplot(acme, aes(x=Years, y=StSalary, colour= Degree)) + geom_point())

#5 Find the correlation between Starting Salary and Years of Experience?

corgen <- cor(acme$StSalary, acme$Years)
print(corgen)

#a. Is the correlation different for each gender?
GC<- acme %>% group_by(Gender) %>% summarize(cor=cor(StSalary, Years))
print(GC)

#The correlation is different for all gender.

#b. Is the correlation different for each degree? 
DC <- acme %>% group_by(Degree) %>% summarize(cor=cor(StSalary, Years))
print(DC)

#The correlation is different for all degrees.

#6 What can you conclude about Acme with respect to gender bias after your 
#overall analysis? 

m <- acme %>% group_by(Gender) %>% summarise(mean(StSalary))
m

# After the overall analysis,the year of experience required for starting salary of females 
# is more as compared to that of males after observing the correlation between the 
# salary and years of experience among the gender. Hence, there seems to be a gender bias.


