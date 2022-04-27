###------------------
###Regression and Clustering
###------------------

###Students Name: Deepti Vijay Khandagale
###GNumber: G01353007


rm(list=ls())

install.packages(ggplot2)
setwd(getwd())



library(ggplot2)
library(dplyr)
library(cluster)

data <- read.csv('EmployeeAttrition.csv')
str(data)


#### 1. Regression ####
# a. Show the scatter plot with relationship curve between TotalWorkingYears and MonthlyIncome. 
# Briefly explain your observation in the plot (Hint: Use scatter.smooth() function in R) (5 points)

data2 <- scatter.smooth(x=data$TotalWorkingYears, y=data$MonthlyIncome, main = "Total Working Hours vs Monthly income",
                        col="darkgrey", xlab="Total Working years", ylab = "Monthly Income")
print(data2)
ggsave("data2.png")

# As per the plot in data2,it can be said that the monthly income is increasing with a total working years of 
#experience this means,the TotalWorkingYears and MonthlyIncome shows a positive linear relationship.
# in few data points there are cases where with the total working years, the salary is not increasing much.

# b. Show the scatter plot with relationship curve between Age and DistanceFromHome.
# Briefly explain your observation in the plot (Hint: Use scatter.smooth() function in R) (5 points)

data3 <- scatter.smooth(x=data$Age, y=data$DistanceFromHome, main = "Age vs Distance from home",
                        col="darkgrey", xlab="Age", ylab = "Distance from home")
print(data3)
ggsave("data3.png")

# As per the plot in data3, the horizontal line at "Distance from home=8", shows that at any points at Age
# the average distance is 8 for all age group. Hence, it can be said that the Age do not affect
# distance from home and therefore there doesn't exist a relationship between Age and distance from home.

# c. Calculate Correlation for (a) and (b) and explain the values to support your answer in (a) and (b) (5 points)

print(cor2 <- cor(x=data$TotalWorkingYears, y=data$MonthlyIncome))

# The correlation for the (a) is 0.77 which suggests a strong positive linear relationship between the
# total working hours and the monthly income.

print(cor3 <- cor(data$Age, data$DistanceFromHome))

# The correlation for the (b) is -0.0016 which suggests a negligible or very weak relationship between the
# Age and the distance from home

# d. Using Linear Regression, find details of the relationship between TotalWorkingYears and
# MonthlyIncome. Explain results in terms of p-value at 95% confidence interval and
# determine whether the relationship is significant or not (Hint: Use lm() to create linear regression 
# model. Use print() to show coefficients. Use summary() to show more details) (15 points)

print(lm.work <- lm(MonthlyIncome ~ TotalWorkingYears, data=data))

print(summary(lm.work))

# The p-value is less than 0.05, which means that we reject the null hypothesis i.e the MonthlyIncome
# is dependent on the TotalWorkingYears.

#### 2. Clustering ####
# a. Use K-means Clustering algorithm to find groups between HourlyRate and
# TotalWorkingYears. Use number of clusters as 3. Explain how each group is different
# from another in terms of employees representing those groups. (10 points)

print(data4 <- data.frame(data$HourlyRate, data$TotalWorkingYears))

print(cl <- kmeans(data4, 3))
print(cl$cluster)
print(cl$centers)

data4$clu = as.factor(cl$cluster)
print(head(data4))

cluster3 <- ggplot() + ggtitle("Total Working Hours v/s Hourly Rate with k=3") +
  geom_point(data = data4,
             mapping = aes(x = data.HourlyRate, 
                           y = data.TotalWorkingYears, 
                           colour = clu)) +
  geom_point(mapping = aes_string(x = cl$centers[, "data.HourlyRate"], 
                                  y = cl$centers[, "data.TotalWorkingYears"]),
             color = "red", size = 4)
print(cluster3)

ggsave(cluster3.png)

# In the above plot with clusters as 3, it is observed that the clusters are grouped based on the 
# HourlyRate from 30 to around 55, 55 to around 77 and 77 to around 100


# b. Use number of clusters as 5. What did you observe? Did you see any split of groups
# observed in (a)? Observe the splitting groups and explain in terms of employees
# representing those groups. (Hint: Use kmeans() for clustering algorithm. Install ggplot2 library in 
# R and use ggplot() function to visualize the clustering results) (10 points)

print(data5 <- data.frame(data$HourlyRate, data$TotalWorkingYears))

print(cl <- kmeans(data5, 5))
print(cl$cluster)
print(cl$centers)

data5$clus = as.factor(cl$cluster)
print(head(data5))

cluster5 <- ggplot() + ggtitle("Total Working Hours v/s Hourly Rate with k=5") +
  geom_point(data = data5,
             mapping = aes(x = data.HourlyRate, 
                           y = data.TotalWorkingYears, 
                           colour = clus)) +
  geom_point(mapping = aes_string(x = cl$centers[, "data.HourlyRate"], 
                                  y = cl$centers[, "data.TotalWorkingYears"]),
             color = "red", size = 4)
print(cluster5)

ggsave(cluster5.png)

# In the above plot with clusters as 5, it can be observed that :
# 1. The 3 clusters in the previous plot are splitted to 5 clusters based on the hourly rate 
# from 30 to around 48 and from 48 to around 64. 
# 2. The third cluster which was earlier from 77 to around 100 is splitted into three clusters 
# from 64 to 83 and from 83 to 100 but with total working hours below 20.
# 3. The light blue cluster is splitted from the third cluster in the previous plot which 
# is showing as the total working hours above 20.
