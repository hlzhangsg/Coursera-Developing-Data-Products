library(shiny)
library(rCharts)

# Define UI 
shinyUI(fluidPage(
  titlePanel("The stock price change for year 2015"),
  
  # Sidebar 
  sidebarLayout(
    sidebarPanel(
      h5("Draw the stock price chart for Year 2015 by week"),
      br(),
      radioButtons(inputId = "name", 
                   label = "Select a stock:", 
                   choices = c("APPLE", "IBM", "Microsoft"), 
                   selected = "APPLE"), 
      br(),
      sliderInput("range",
                  label = "Month to display:",
                  min = 1,
                  max = 47,
                  value = c(1,47)
                  ), 
      br(),
      helpText("The stock price from year 2015",
               "Please hover over the lines to get exact",
               "values or click on the Raw Data tab.",
               "For more infomation on how the data was", 
               "collected and how the app works,",
               "please check the ", tags$a(href="http://rpubs.com/nierhoff/Shiny-App-Pres", "project documentation"),
               "and whole code and data can",
               tags$a(href="https://github.com/hlzhangsg/Coursera-Developing-Data-Products", "be found here."))
    ),
    
    # Show the plot 
    mainPanel(
      tabsetPanel(
        tabPanel("Plot", showOutput("plot", "highcharts")),
        tabPanel("Raw Data", dataTableOutput("table"))
      )
    )
  )
))