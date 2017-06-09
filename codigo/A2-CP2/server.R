#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
require("ggplot2")
library("dplyr")
library("tidyr")
library("readr")
library(plotly)
series_from_imdb <- read.csv("/home/gustavonsy/Documentos/Analise-de-Dados/dados/series_from_imdb.csv")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  output$newPlot <- renderPlot({
    the_100 %>% 
      plot_ly(x = ~series_ep,
              y = ~UserRating,
              name = "The 100",
              type = "scatter",
              mode="lines+markers",
              text= ~paste('Votos r10:', format(round(r10, 3), nsmall = 3)),
              color= ~r1,
              colors = c("blue","yellow","red")) %>% 
      return()
  })
  
})
