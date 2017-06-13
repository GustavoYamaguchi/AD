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
series_from_imdb <- read.csv("./series_from_imdb.csv")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  the_100 <- series_from_imdb %>% 
    filter(series_name=="The 100")
  
  #output$series_name <- unique(c(as.character(series_from_imdb$series_name)))
  
  output$newPlot <- renderPlotly({
    series_filtro <- c()
    i <- 1
    for(item in input$nomeDaSerie){
      series_filtro[[i]] <- item[1]
      i <- i+1
    }
    nome_analise <- "Quantidade de"
    if(input$analise=="r1"){
      nome_analise <- paste(nome_analise, "Haters")
    } else if(input$analise=="r10"){
      nome_analise <- paste(nome_analise, "Lovers")
    } else if(input$analise=="UserVotes"){
      nome_analise <- paste(nome_analise, "usuarios que votaram")
    } else{
      nome_analise <- "Nota do Episodio"
    }
    plot_ly(data = series_from_imdb %>% filter(series_name%in%series_filtro), 
            x = ~ series_ep, 
            y = ~ get(input$analise), 
            name = "temporada",
            mode = "lines+markers",
            color = ~as.character(series_name), 
            text = ~series_name,
            hoverinfo = "text") %>% 
      layout(title="Analise grafica",
             xaxis= list(title = "Episodio da serie"),
             yaxis= list(title = nome_analise))
  })
  
})
