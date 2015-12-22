source("Read_Data.R", echo=TRUE)

##NOTE!!! The app takes a couple seconds to load
shinyUI(pageWithSidebar(
        
        headerPanel("Regression Models Analysis of the San Francisco 49ers"),
        sidebarPanel(
                sliderInput('Years', "Choose the minimum year you would like for your analysis",
                            1970, min=1970, max=2014, step=1, sep=""),
                radioButtons("Predictors", "Predictor Variables:", choices=c("Points For"="1", "Total Yards"="2"
                                                                          ,"Offensive Plays"="3", "Yards per Play"= "4",
                                                                          "Total Turnovers"="5", "Fumbles Lost"="6", "Total 1st Downs"="7",
                                                                          "Pass Completions"="8", "Pass Attempts"="9",
                                                                          "Passing Yards"="10", "Passing TDs"="11",
                                                                          "Interceptions"="12", "Passing Yards per Attempt"="13",
                                                                          "Passing 1st Downs"="14", "Rush Attempts"="15",
                                                                          "Rushing Yards"="16", "Rushing TDs"="17",
                                                                          "Yards per Rush Attempt"="18", "Rushing 1st Downs"="19",
                                                                          "Penalties"="20","Penalty Yards"="21")),
                radioButtons("Response", "Response Variable:", choices=c("Wins"="wins", "Losses"="losses")),
                submitButton(text="Analyze")
                
        ),
        mainPanel(
                tabsetPanel(
                        tabPanel("Source Info",
                                 h4("The data provided for this analysis was from", a("http://www.pro-football-reference.com/", href="http://www.pro-football-reference.com/"))),
                        tabPanel("Data Table",
                                h4("San Francisco 49ers Data"),
                                dataTableOutput("data_table")),
                        tabPanel("Regression Analysis",
                                 plotOutput("regression_plot"),
                                 verbatimTextOutput("Summary")),
                        tabPanel("Residual Analysis",
                                 plotOutput("residual_plot"),
                                 plotOutput("residual_plot2"))
                )
        )))