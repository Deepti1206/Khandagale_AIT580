---
layout: post
title:  "City health services impact on public health in US"
date:   2022-05-08 22:57:55 -0400
author: "Deepti Vijay Khandagale, Satwika Reddy Kondi"
categories: jekyll update
---
Health is the most important aspect of life. In today's world, with unhealthy food habits and lifestyle foods, the chance of weight gain, heart diseases and Blood Pressure  related problems are increasing. On the other hand, medical treatments have become expensive. As said, `Prevention is better than cure`, the health services around the United States have taken up a project to focus on public health and prevent the risk of disease and health issues. One of the interesting projects is "PLACES" which works on the analysis of risks and diseases and habits common across the population.

![PLACES logo](/images/500-cities-logo.png "PLACES logo"){:class="img-responsive"}

# BACKGROUND
`PLACES` the expansion of The 500 Cities Project, is a partnership project between the Center for Disease Control (CDC) and the Robert Wood Johnson. It focuses on providing towards model-based analysis of health estimates for local areas across the United States. For the first time, it supplied data for cities and census tracts, many of which covered multiple counties across the United States. These data can be filtered (by city and/or tracts, as well as by measure) and downloaded by end-users for use in different analyses.
This initiative provided the display, retrieval and exploration of health care data, risk factors and habits that have a significant impact on the health of the population.

The analysis  enabled local health departments and authorities to better understand the burden and geographic distribution of health measures in their areas, independent of population size or rurality, and to aid them in planning public health actions.
This project employed small area estimating methods to acquire 27 chronic illness indices for the 500 largest American cities by reporting city and census tract-level data. The data were made public through the "500 Cities" website, which allowed visitors to browse, examine, and download data at the city and tract levels. Despite the limitation of data till
county levels, this approach supplemented current surveillance data, allowing researchers to gain a better understanding of the health challenges that people of that city or census tract face.

# DATA CURATION
The Center for Disease Control (CDC) has collected the data primarily from the CDC Behavioral Risk Factor Surveillance System, the Census 2010 population and the American Community survey. The Centers for Disease Control and Prevention (CDC) is the public health agency of the United States of America. It works around the clock to protect America from both foreign and domestic health, safety, and security threats. It conducts critical research and disseminates health information to protect the United States from hazardous health problems, as well as responding to them when they arise. The only data used will be the CDC’s 2018 500 Cities Data. The Center for Disease Control is open about its data and techniques, as well as the limitations and issues. As a result, they’re perhaps the most reliable source of information on the subject.

The PLACES Project took over from the 500 Cities Project in December 2020. It was a collaboration between the Centers for Disease Control and Prevention, the Robert Wood Johnson Foundation, and the CDC Foundation. It offered small area estimates for chronic disease risk factors, health outcomes, and clinical preventive care utilization for the major 500 cities in the United States at the city and census tract level. These small-area estimates aided cities and local health departments in better understanding the burden and spatial distribution of health-related factors in their jurisdictions, allowing them to better plan public health interventions. Cities and other stakeholders, might have used this high-quality, small-area epidemic data to implement effective and focused prevention programs for health problems and monitor critical health targets. City planners and elected officials, for example, may have wished to utilize this information to target neighborhoods with high rates of smoking or other health-risk behaviors for successful interventions.

We are going to use the dataset which is given on the [PLACES website](https://chronicdata.cdc.gov/browse?limitTo=datasets&q=PLACES+2021).The good thing about the dataset is that it is organized in a dataset for analysis. However, the dataset is not clean i.e there are unnecessary and null values in the data set that needs to be cleaned. Hence, we will do a data cleaning for accurate analysis and predictions. The dataset is available in the public domain making it easier for researchers and analysts to use it and make recommendations to the relevant stakeholders.

# OBJECTIVE
Here we are trying to find the solution for the given questions:
1. Does the city make a difference in how much a population uses preventative services?
2. Can Cities Impact Healthy Behaviors?
3. What can the city do to drive greater use of the services?

# REQUIREMENTS AND RESOURCES
We will be using `RStudio` to analyze the dataset . The necessary `R packages` and `R libraries`. Also we will use `ggplot2` for visualization purposes wherever needed.

As the data may contain missing values or unnecessary features, we will follow the data pre-processing which includes data cleaning and feature selection:
- Removal of variables that are not necessary for analysis
- Removal of duplicates.
- Removal of extreme values
- Selection of important features

# DESCRIPTIVE ANALYSIS
Before beginning to analyze any data, the first step is to know your data well. We will begin first by loading dataset and knowing datatype using the `functions and codes in R`. In the output, you can see that there are 810,103 observations and 24 variables (i.e 810,103 rows and 24 columns in a dataframe). The structure of each variables are given. For example, for “StateAbbr”, the datatype is “chr” (character) and displays a short list of observations under the variable.
You can find the entire code and `output`[code link](https://github.com/Deepti1206/Khandagale_AIT580/blob/main/docs/analysis/AIT580_Final_Khandagale_Kondi_Rmarkdown.Rmd) here.

![str_data_health](/images/str_data_health.png "str_data_health"){:class="img-responsive"}

We follow data processing steps in order to clean and transform the dataset

### Data cleaning and transformation
There are different methods to find the missing values. The below visualization helps to find a missing value in data, however it doesn't give the complete details hence we check summary to know other missing values too. But for understanding, interpret the plot as where `TRUE` represents missing values in a data.
[code link](https://github.com/Deepti1206/Khandagale_AIT580/blob/main/docs/analysis/AIT580_Final_Khandagale_Kondi_Rmarkdown.Rmd)

![Barplot_missing](/images/Bar_missing.png "Barplot_missing"){:class="img-responsive"}

Noe that the visualizing the missing value is not enough, we need to look at the summary of the data and also consider the important variables like data_value which will help in analysis, we will consider it. After studying the summary report, we found that there are 16 unnecessary columns and we decide to remove it. The data is now reduced to the 810,103 observations and 8 variables and the columns are renamed for styling purposes. We also look at the statistical measures like mean, median, standard deviation to get glimpse of the variation in a data.

![Summary_data](/images/summary_data.png "Summary_data"){:class="img-responsive"}

Also, it is necessary to know that the model cannot fit into the character datatype (i.e data which has categories) and hence we convert those datatypes into numerical values. After that we will check the statistical description.

To answer our research questions , we decided that the variables which are likely to be used for study are preventive measures and healthy behaviors where the city can have direct influence, which may then impact the health outcomes. For this, we will carry out hypothesis testing and begin by looking at preventative services which consist of a number of outcomes. We will also use this dataset to predict if the measures taken by cities have a significant influence on the healthy behaviors within the population. Some of the variables that will help answer this question include: “No leisure-time physical activity among adults aged >=18 Years” (LPA) ”Sleeping less than 7 hours among adults aged >=18 Years” (SLEEP) “Binge drinking among adults aged >=18 Years” (BINGE) ”Current smoking among adults aged >=18 Years” (CSMOKING).

Since we want to look at the city health service effect on health, we  to look at disease types and the value at city level. We will look at the dimension, datatype and find out missing values in the census dataframe. If you see, the missing value in “PAPTEST” is big and hence we will eliminate this column from our data. We will also rename the columns for better styling guide.
[code link](https://github.com/Deepti1206/Khandagale_AIT580/blob/main/docs/analysis/AIT580_Final_Khandagale_Kondi_Rmarkdown.Rmd)

![cities](/images/cities.png "cities"){:class="img-responsive"}
![Skim_census](/images/Skim_census_2.png "Skim_census"){:class="img-responsive"}

### Checking the variation of the data

After, transforming the data, we should check how the data looks like i.e if the data has lot of variations. That can be checked through visualizing the distribution of the data.

![Barplot_states](/images/Barplot_states.png "Bar_plot states"){:class="img-responsive"}

We have created the visualization of the population against the states. As you can see, this data is skewed considerably in favor of a few states. For various reasons, including culture, legislation, and weather, we can’t assume that what works in California would work in Alaska. However, 11 states had only one city investigated, while California has 83. The accuracy of my findings could therefore be affected by the client’s location. This happened because the study concentrated on the country’s largest cities, then added a few more to guarantee that every state was covered. With this in mind, it’s understood if you’re concerned about how this would apply to a tiny town.

# RESULTS AND FINDINGS

Now we are done with data pre-processing, let's go back to our objective questions.

### Does the city make a difference in how much a population uses preventive services?

It could be likely that the city can influence the usage of preventative services and healthy behaviors, which may therefore impact health outcomes. To verify that theory, we’ll start with preventative services, which include things like:

- “Current lack of health insurance among adults aged 18–64 Years,” (ACCESS2)
- “Visits to doctor for routine checkup within the past Year among adults aged >=18 Years,” (CHECKUP)
- Fecal occult blood test, sigmoidoscopy, or colonoscopy among adults aged 50–75 Years,” (COLON_SCREEN)
- “Mammography use among women aged 50–74 Years,” (MAMMOUSE)
- “Visits to dentist or dental clinic among adults aged >=18 Years,” (DENTAL)
- “Cholesterol screening among adults aged >=18 Years,” (CHOLSCREEN)
- “Older adult men aged >=65 Years who are up to date on a core set of clinical preventive services: Flu shot past Year, PPV shot ever, Colorectal cancer screening,” (COREM)
- “Older adult women aged >=65 Years who are up to date on a core set of clinical preventive services: Flu shot past Year, PPV shot ever, Colorectal cancer screening,” (COREW) “Papanicolaou smear use among adult women aged 21–65 Years.” (PAPTEST)

It is true that the size of a city has an impact on how much a population uses preventative services. If there is a difference, it indicates that it is something that the city can influence and change. If not, it’s possible that the United States as a whole has its own patterns of preventative service use, and the city will have to search elsewhere for effective ways to enhance its health.

We will use `ggplot2` for visualizing the variations in each attributes. As you can see, there are variances between all of the preventative services, some of which are rather significant.

![Barplot_data](/images/Barplot_data.png "Bar_plot"){:class="img-responsive"}

As we can see, the gap between cities in terms of access2, a measure of how much of a population lacks health insurance, can be as large as 4.50 percent of the population vs. 44.40 percent. Access2 is quite interesting because it is the one that has the most difference between cities (albeit very narrowly), as well as for other reasons that will be detailed shortly. We will investigate further to learn more about its distribution.
[code link](https://github.com/Deepti1206/Khandagale_AIT580/blob/main/docs/analysis/AIT580_Final_Khandagale_Kondi_Rmarkdown.Rmd)

We will use `boxplot` and `histogram` to check it's variance.

![Barbox_cities](/images/Box_bar_cities.png){:class="img-responsive"}

As you can see, the image to the left is the `histogram` and image to the right is the `boxplot` showing how the data is varying . There appear to be some outliers on the high end. Most of the data lies between 10 and 20 percent, meaning that it is likely the client will have at least some options for improvement in this area.

### Can cities impact healthy behaviors?

As previously stated, we will primarily consider obesity as a result rather than a behavior. As a result, we’ve identified four healthy behaviors that a city can influence:

- “There is no leisure-time physical activity among persons over the age of 18” (LPA)
- “Sleeping fewer than 7 hours in adults over the age of 18” (SLEEP)
- “Binge drinking in adults over the age of 18” (BINGE)
- “Adults above the age of 18 who are currently smoking” (CSMOKING)
[code link](https://github.com/Deepti1206/Khandagale_AIT580/blob/main/docs/analysis/AIT580_Final_Khandagale_Kondi_Rmarkdown.Rmd)

![Plot_unhealthy](/images/plot_unhealthy.png){:class="img-responsive"}

Here we can see that there is inconsistency in the lack of leisure-time physical exercise, which is 44.2 percent vs 12.60 percent. It’s comparable, except the maximum and minimum values are significantly higher. It’s odd, though, that the different cities have such inconsistency in the percentages of people who engage in leisure-time physical activity.

We will take a closer look at the variable that makes the most difference once more.

![Boxplot_phy](/images/Boxplot_phy.png "box_plot"){:class="img-responsive"}

Now that we’ve established that cities use preventative services differently, we need to figure out why. What can the city do to encourage more people to use the services? The initial hypothesis is based on the inclusion of access2, which is the percentage of the population that are uninsured. As the name implies, we believe this can tell us whether a population is not getting preventative care because they do not have insurance, making the services unaffordable. If this is the case, the small city could make a difference in the usage of preventative treatments by assisting their citizens in becoming insured or ensuring that the services are available in an accessible and affordable manner. We will now create a correlation matrix followed by a heatmap. We will be looking at the use of preventative services and will be interested in any correlations with an absolute value above 0.65.

![Heatmap_care](/images/Heatmap_care.png "Correlation"){:class="img-responsive"}

The heatmap can be interpreted as, the most light and dark colors show a strong relationship (darkest shows positive relationship means with a change in independednt variable, dependent variable will increase and vice versa). From the heatmap, the relationships between access2 and dental, corem, corew, cholscreen, and colon screen are among the more intriguing. Also visible are connections between corem and corew, as well as correlations with dental, cholscreen, and colon screen. Surprisingly, dental has a link to cholscreen and colon screen. It is surprising that there was no stronger link between access2 and checkup, or checkup and some of the other metrics. However, access2 has the strongest connection with the most variables. This doesn’t strictly confirm any notion (we would need additional data), but it does give it some credence as a possibility.

### Does the use of health services make any difference in the city?

The second consideration is whether or not using these services is beneficial. The client’s purpose isn’t to force residents to use its preventative services. Its goal is to improve the residents’ health. Use of preventative services may be one of the areas where cities may make the most difference, but does their use have an impact on the city’s health? We will be using the following health outcomes for analysis:
- “Stroke in people over the age of 18” (STROKE)
- “Obesity in people beyond the age of 18” (OBESITY)
- “All teeth are lost in adults over the age of 65.” (TEETHLOST) “Diabetes diagnosed in adults over the age of 18” (DIABETES)
- “Cancer in adults over the age of 18 years (excluding skin cancer)”
- (CANCER) “Chronic obstructive pulmonary disease (COPD) in people over the age of 18” (COPD)
- “Coronary heart disease in adults above the age of 18” (CHD) “Current asthma in people over the age of 18” (CASTHMA)
- “Chronic renal disease in persons above the age of 18” (KIDNEY)
- “Taking medication to treat high blood pressure in persons over the age of 18 who have high blood pressure” (BPMED)
- “High cholesterol in persons over the age of 18 who have had a screening in the previous 5 years” (HIGHCHOL)

We will use visualization to see the relation between population without insurance and poor physical mental health. As you can see, the number of people who have battled with physical health and mental health increases in cities as the number of people without health insurance rises. This is a fascinating result, especially since we’ve already seen that health insurance corresponds with the usage of other measurable preventative treatments. There may also be preventative services and treatments that were not measured but are nonetheless influenced by health insurance.

![Plot insure](/images/Plot_insure.png "Insurance"){:class="img-responsive"}

We can look at the function of health insurance in high cholesterol and cholesterol testing as another, particularly intriguing example:

![Scatter_insure](/images/scatter_insure.png "Insurance scatter"){:class="img-responsive"}

As you can see, the greater the number of people who have high cholesterol, the more people who are screened for it. When health insurance is included in, however, we can see that people without health insurance are more likely to have high cholesterol and are less likely to be evaluated for it.

Finally, ,let's have a look at overall correlations,

![Heatmap_chol](/images/Heatmap_chol.png "Correlation cholesterol"){:class="img-responsive"}

Access2 has a link to 'phlth', 'mhlth', and 'teethlost', which was previously discovered to have a link to the utilization of preventative treatments. There is a link between checkup and 'bphigh' and 'bpmed'. 'Corem' and 'corew' have links to 'phlth', 'mhlth', and tooth loss. Only 'Corew' is compatible with diabetes and kidney disease. 'Cholscreen' has an odd relationship with cancer and health. 'phlth', 'mhlth', and 'teethlost are used in colon screen. Dental problems include 'phlth', 'mhlth', stroke, obesity, 'copd', diabetes, kidney failure, and tooth loss. There’s always the chance of coincidental correlations, and everything is exacerbated by the fact that many of these outcomes are highly correlated. High levels of diabetes, coronary heart disease, and COPD, for example, are all linked to an increased risk of stroke.

# FINDINGS

- Because a population’s health insurance, usage of preventative services, and even harmful behaviors can differ throughout places, there is a chance (but not a guarantee) that they will be influenced by them.
- It does not appear that the size of the city makes a difference.
- Negative health outcomes are linked to a high prevalence of unhealthy habits and/or insufficient utilization of preventative interventions.
- As a result, the research does not rule out the possibility that a city can reduce the number of strokes, coronary heart disease, high cholesterol, diabetes, and other adverse health consequences.
- Failure to employ many preventative services is linked to a lack of health insurance.
- This lends some credence to the theory that a part of the population is deterred from using these services due to their high cost.
- Physical inactivity during leisure time is linked to a variety of unfavorable health effects.

# LIMITATIONS

This analysis has a number of flaws, the most notable of which is the lack of data pertaining to the envisioned customer city. I recommend that any small city look into the health issues that are now plaguing its population for additional research and more precise, accurate recommendations. The CDC’s data can be used to create a model for future research. Interventions can thus be tailored to the specific health issues that a group faces. Missing values has an impact on the reliability of the results of the analysis.

# REFERENCES
<!--UL-->

1. CDC,(2020, December 8), PLACES: Local Data for Better Health. Retrieved from [https://www.cdc.gov/places/index.html](https://www.cdc.gov/places/index.html)
2. H. Wickham. ggplot2: Elegant Graphics for Data Analysis. Springer-Verlag New York, 2016. Retrieved from [https://ggplot2.tidyverse.org](https://ggplot2.tidyverse.org)
3. V M Taylor, (1995, June), Repeat mammography use among women ages 50-75. Retrieved from [https://pubmed.ncbi.nlm.nih.gov/7655338/](https://pubmed.ncbi.nlm.nih.gov/7655338/)
4. Coding file [https://github.com/Deepti1206/Khandagale_AIT580/blob/main/Assignment_11/Assignment11.Rmd](https://github.com/Deepti1206/Khandagale_AIT580/blob/main/Assignment_11/Assignment11.Rmd)


# DEFINITIONS

- CDC : Center for Disease Control and Prevention
- R language: Software language for statistical visualization
- [Measure Definitions](https://www.cdc.gov/places/measure-definitions/index.html)
