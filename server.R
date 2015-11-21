library(shiny)
library(rCharts)

dat <- read.csv('data.csv')
source("stockData.R")

options(RCHART_WIDTH = 500)

shinyServer(function(input, output) {
  
  # Generate a chart for the selected stock name
  output$plot <- renderChart2({
    selected <- input$name
    stock <- subset(dat, name == selected & Period %in% seq(input$range[1], input$range[2], 1))
    #stock <- subset(dat, name == selected )
    h1 <- hPlot(
      x = "Period", 
      y = "Price", 
      data = stock, 
      type = "line")
  })
  
  # Generate an HTML table view of the data
  output$table <- renderDataTable({
    dat[,-1]
  })
})


