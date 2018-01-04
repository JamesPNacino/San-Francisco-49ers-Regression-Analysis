# San-Francisco-49ers-Regression-Analysis

## Introduction
Linear Regression Analysis to find the correlation between various predictors and the number of wins/losses (response variable) for the San Francisco 49ers Professional Football Team since the year 1970. **Click this link to go to the web application:** [**Click Here!!**](http://jnacino.shinyapps.io/NFL_49ers_Regression_Analysis)

The data for this analysis is provided by: **http://www.pro-football-reference.com/**

## Install Packages

To implement this project yourself you must download the following packages:

* Shiny
* ggplot2
* XML

You must also have R and Rstudio installed.

## Method

Using R software we can analyze various correlations between the explanatory variables and response variables using linear regression. Using the web app, we can change the minimum year for analysis, the predictor, and lastly the response variable. Linear regression seemed to be a signifcant model for testing many of the explanatory variables. We found that many p-values were less than an alpha of .05 when testing different explanatory variables. Linear regression was a correct fit for many of the analyses. This was proven due to residual analysis of the data points, making linear regression a significant machine learning model for this dataset. Below are the following variables used for linear regression testing.

**Predictors - Data**

1. Points For - Total points scored each year
2. Total Yards - Total yards accumulated each year
3. Offensive Plays - Total amount of offensive plays ran each year
4. Yards per Play - Average yards per play each year
5. Total Turnovers - Total amount of turnovers each year
6. Fumbles Lost - Total amount of fumbles lost each year
7. Total 1st Downs - Total amount of first downs each year
8. Pass Completions - Total amount of pass completions each year
9. Pass Attempts - Total pass attempts each year
10. Passing Yards - Total Passing yards each year
11. Passing TDs - Total passing TDs each year
12. Interceptions - Total interceptions each year
13. Passing Yards per Attempt - Average passing yards per attempt each year
14. Passing 1st Downs - Total 1st downs each year through passing the ball
15. Rush Attempts -  Total rush attempts each year
16. Rushing Yards - Total rushing yards each year
17. Rushing TDs - Total Rushing TDs each year
18. Yards per Rush Attempt - Average yards per rush attempt each year
19. Rushing 1st Downs - Total 1st downs each year through the ground
20. Penalties - Total penalties accumulated each year
21. Penalty Yards - Total penalty yards accumulated each year

**Response Variables**

1. Wins - Total amount of wins each year
2. Losses - Total amount of losses each year


## Testing

Using the web application that I made, [**Link**](http://jnacino.shinyapps.io/NFL_49ers_Regression_Analysis), I was able to test the various predictors and their correlation to the response variables. Using residual analyses, many of the predictors' residuals seemed randomly scattered when plotted. Also, using a histogram and a normal-qq plot, I analyzed the fit of the residuals to see if they had followed a normal distribution. Using all three methods: the scatterplot, histogram, and normal-qq plot of the residuals, the datapoints for all of the predictors seemed to be random and normally distributed when tested against both response variables, wins and losses (though some datapoints from various predictors fit the random normal distribution better than others). Due to residual analysis I was able to conclude that linear testing would be a signifcant machine learning model to use for testing the data. 

When running the linear model analysis through R software, it reports many values. The two values that are very signifcant in the report is the p-value and the R-Squared value (shown as multiple R-squared in the web app).  The p-value tells the significance of the model. A p-value less than .05 means that the linear model is indeed significant. For example, if I had a p-value of .04, this means that there is a 96% probability (100% - 4%) that the slope of the linear model is not zero. Note, that if the slope is zero, then an increase in our predictor variable does not affect on the response variable. The R-squared value is used to determine the accuracy that our linear model will predict. the closer the R-squared value is to 1, the more accurate the predictions will be as an R-squared value of 1 means a perfect linear fit of the data set. 

Using data all the way from 1970, I fitted a regression model using different predictors against the response variable.


## Results and Conclusion

Results show that all of the predictor variables were significant in correlation to the number of **wins** except for the following predictor variables (these were not significant becuase of a p-value greater than .05): 

1. Pass Attempts
2. Yards per Rush Attempt
3. Penalties
4. Penalty Yards

I was not surprised to see *pass attempts* as a non a signinficant predictor towards the number of wins because teams usually pass more when they are behind in a game. However, I was surprised to see *yards per rush attempt*, *penalties*, and *penalty yards* as not a significant predictor in determining the number of wins you will have each year.

Results show that all of the predictor variables were significant in correlation to the number of **losses** except for the following predictor variables (these were not significant becuase of a p-value greater than .05): 

1. Offensive Plays
2. Pass Completions
3. Pass Attempts
4. Yards per Rush Attempt
5. Penalties
6. Penalty Yards

The most accurate model (highest R-squared value) for determining the number of losses would be to using *passing yards per attempt*, while the most accurate model for determining the number of wins would be using *points for* as the predictor variable.

I have tested linear models on data points since the year 1970. The more data we have, the more accurate out prediction should generally become. However, the game of football has changed over time due to rules changing and different way offenses and defenses are ran. Using an earlier year for analysis can affect the significance of the regression model.
