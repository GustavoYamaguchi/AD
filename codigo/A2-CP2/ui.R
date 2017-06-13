#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library("plotly")

shinyUI(fluidPage(
  
  # Application title
  titlePanel("Filtros disponiveis"),
  
  # Sidebar with controls to select a dataset and specify the
  # number of observations to view
  sidebarLayout(
    sidebarPanel(
      selectInput("nomeDaSerie", "Escolha a serie que gostaria de analisar:", multiple=TRUE,
        selected = "Breaking Bad",
        c("Breaking Bad", "Dexter","13 Reasons Why","The 100",
          "The Simpsons", "Flash", "Friends", "Game of Thrones", 
          "Arrow", "Suits")),
      selectInput("analise", "Escolha o que voce gostaria de analisar:",
                  selected = "r1",
                  c("r1","r10","UserRating","UserVotes"))
    ),
    
    # Show a summary of the dataset and an HTML table with the 
    # requested number of observations
    mainPanel(
      plotlyOutput("newPlot")
    )
  )
))