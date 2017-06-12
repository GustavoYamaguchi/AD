#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

shinyUI(fluidPage(
  
  # Application title
  titlePanel("Shiny Text"),
  
  # Sidebar with controls to select a dataset and specify the
  # number of observations to view
  sidebarLayout(
    sidebarPanel(
      selectInput("nomeDaSerie", "Escolha a serie que gostaria de analisar:", multiple=TRUE,
                #  choices = "output$series_name")
      c("Breaking Bad", "Dexter"))
    ),
    
    # Show a summary of the dataset and an HTML table with the 
    # requested number of observations
    mainPanel(
      plotlyOutput("newPlot")
    )
  )
))