###------------------
###Visualization
###------------------

###Students Name: Deepti Vijay Khandagale
###GNumber: G01353007


rm(list=ls())
setwd(getwd())
library(ggplot2)

print(data <- read.csv('EmployeeAttrition.csv'))
head(data)

#Q.1: Create Histogram for Age using R

Histogram <-print(hist(data$Age, main = "Histogram of Employee Age", xlab = "Age", col="cadetblue"
     , border = "black"))
ggsave("Histogram_R.png")

# The histogram of the Age is plotted. The graph can clearly show the interval of Age (continuous varaible)
# on the X-axis and the frequency of the Age on the Y-axis.Through the labels and the graph one can say 
# that the maximum employees in the company lies between the age of 30-40 years.

#Q.3: Create Scatter Plot for Age and Monthly Income using R

Scatterplot <- print(ggplot(data = data, aes(x=Age, y=MonthlyIncome)) + geom_point())
ggsave("Sactterplot_R.png")

# In the scatter plot, the Age is plotted on the X-axis and the Monthly income on the Y-axis.
# The graph shows the relation between the Age and the monthly income. It can be clearly seen 
# from graph that the Age and monthly income has the positive linear relation.

