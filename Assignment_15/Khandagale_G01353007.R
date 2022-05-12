library("selectr")
library("xml2")
library("rvest")
library("dplyr")


#without_tags <- gsub("<.*?>", "", titles)
#without_tags
# Just sample code.
# titles <- html_nodes(webpage, "div h2")
# without_tags <- gsub("<.*?>", "", titles)
# print(without_tags)

############################### Assignment 15 #################################

# Task 1: write scripts that extract "titles" and "news summary" of articles out of the scrapped data.
# Then, print them out using "print()" statement.

#1
url <- "https://nytimes.com"
webpage <- read_html(url)

title <- webpage %>% html_nodes(".css-1kyt8v5 .css-1pvrrwb") %>% html_text()
print(title)

#2
news_summary <- webpage %>%  html_nodes(".css-17sdgpd .css-1kyt8v5 .css-9lwb1u") %>%
  html_text()
print(news_summary)


# Assignment 15 Task 2: write scripts that organize your data as dataframe with column names, "title" and "news summary", respectively.
# Then, save this dataframe as a CSV file. Name it as "NYT_titles.csv". 

NYT_titles <- data.frame(title,news_summary)
View(NYT_titles)
write.csv(NYT_titles,"NYT_titles.csv")

# Assignment 15 Task 3: once you save the CSV file, commit and push it back to your repository (no R scripts involved for Task 3). 

