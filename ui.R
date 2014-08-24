#
# Developing Data Products
# Final Project

library(shiny)

shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Emissions by Type & Year"),
  
  # Sidebar with a slider input for number of observations
  sidebarPanel( 
    
      helpText("We present total emission by type of vehicle and Year"),
    
      selectInput("select", label = h4("Choose the dimension"),
                  choices = list("Non-road"=1, "Nonpoint"=2, "On-road"=3,  "Point"=4))
  ),
      # Show a plot of the generated distribution
      mainPanel(plotOutput("emissionPlot"))
  )
)
