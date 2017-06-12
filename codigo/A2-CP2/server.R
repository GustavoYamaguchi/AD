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
library("plotly")
series_from_imdb <- read.csv("C:/Users/Gustavo/Documents/Estudos/R/Analise-de-Dados/dados/series_from_imdb.csv")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  the_100 <- series_from_imdb %>% 
    filter(series_name=="The 100")
  
  #output$series_name <- unique(c(as.character(series_from_imdb$series_name)))
  
  output$newPlot <- renderPlotly({
    series_from_imdb %>%
      filter(series_name==input$nomeDaSerie) %>% 
        plot_ly(x = ~series_ep,
                y = ~UserRating,
                name = input$nomeDaSerie,
                type = "scatter",
                mode="lines",
                text= ~paste('Votos r10:', format(round(r10, 3), nsmall = 3)),
                color= ~r1,
                colors = c("blue","yellow","red")) %>% 
      layout(title="Analise grafica",
             xaxis= list(title = "Episodio da serie"),
             yaxis= list(title = "Pontuacao IMDB"))
  })
  
})
