#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

UI <- fluidPage(
  #Applications Title
  headerPanel("Solubility Prediction"),
  
  sidebarPanel(
    selectInput("alcChoice", label = h3("Choice"), choices = list("alcohol 1", "alcohol 2", "alcohol 3"), selected = 1)
  ),
  
  
  mainPanel(
    h3('Plot of Predicted Alcohol Solubility vs Measured Solubility'),
    plotOutput("solPlot", width = "100%", height = "400px")
  )
)
