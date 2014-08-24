library(shiny)
library(ggplot2)
setwd("C:/coursera/jhudatascience/developingprd/finalproject")
load("emission.rda")

shinyServer(function(input, output) {
  
  output$emissionPlot <- renderPlot({         
    if (input$select == 1) {
       display_data <- emission[emission$type=="Non-road",]
       p <- ggplot(display_data, aes(x=year, y=log(pm25))) + facet_grid(. ~ type) + guides(fill=F) +
        geom_bar(stat='identity') + ggtitle('Non-road Emissions') + ylim(0, 20) +
         ylab(expression(paste('Log', ' of PM'[2.5], ' Emissions')))     
    } else if (input$select == 2) {
       display_data <- emission[emission$type=="Nonpoint",]
       p <- ggplot(display_data, aes(x=year, y=log(pm25))) + facet_grid(. ~ type) + guides(fill=F) +
       geom_bar(stat='identity') + ggtitle('Non-Point Emissions') + ylim(0, 20) +
         ylab(expression(paste('Log', ' of PM'[2.5], ' Emissions'))) 
    } else if (input$select == 3) {
       display_data <- emission[emission$type=="On-road",]
       p <- ggplot(display_data, aes(x=year, y=log(pm25))) + facet_grid(. ~ type) + guides(fill=F) +
       geom_bar(stat='identity') + ggtitle('On-road Emissions') + ylim(0, 20) +
         ylab(expression(paste('Log', ' of PM'[2.5], ' Emissions'))) 
    } else if (input$select == 4) {
       display_data <- emission[emission$type=="Point",]
       p <- ggplot(display_data, aes(x=year, y=log(pm25))) + facet_grid(. ~ type) + guides(fill=F) +
       geom_bar(stat='identity') + ggtitle('Point Emissions') + ylim(0, 20) +
         ylab(expression(paste('Log', ' of PM'[2.5], ' Emissions')))         
    }     
 
    print(p)
  })
})