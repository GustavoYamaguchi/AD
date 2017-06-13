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
  titlePanel("Analises criadas a partir de graficos dinamicos", windowTitle = "Problema 2-CP2"),
  
  # Sidebar with controls to select a dataset and specify the
  # number of observations to view
  sidebarLayout(
    sidebarPanel(
      h3("Filtros disponiveis:"),
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
  ),
  
  tags$div(
    h2("Analise das series em questão", align="center"),
    br(),
    p("Temos em mãos uma grande quantidade de dados, e sem dúvidas, podemos tirar muitas
       conclusoes a respeito dessas series disponiveis no filtro à esquerda. Há 10 series
       nos filtros, são elas:"),
    em(p("Breaking Bad")), em(p(" Dexter")), em(p("13 Reasons Why")), em(p("The 100")), em(p("
      The Simem(psons")), em(p(" Flash")), em(p(" Friends")), em(p(" Game of Thrones")), 
      em(p("Arrow")), em(p("Suits")),
    br(),
    p("Em relação às variaveis de comparação, podemos selecionar uma entre:"),
    em(p("r1 (Avaliação mínima)")), em(p("r10 (Avaliação máxima)")), 
    em(p("UserRating (Nota final de um episodio)")), em(p("UserVotes (Quantidade de usuarios que votaram)")),
    p("Todas elas são avaliadas ao longo do tempo (episódios de uma serie)."),
    br(),
    p("Uma avaliação que podemos visualizar é: séries mais recentes como Dexter, Flash e The 100
      (podem ser selecionadas no primeiro filtro, tente fazê-lo), que tiveram uma queda notável no 
      UserRating (avaliação dos usuários, pode ser selecionado no segundo filtro), 
      tiveram uma alta local (nesse episodio e nos vindouros) de votações nesses episódios. 
      Nesse exemplo: The 100 no episódio 36, teve uma queda de nota muito grande, quando trocamos o 
      filtro para UserVotes (quantidade de usuarios que votaram nesse episódio), notamos um pico de votos,
      em outras palavras, quando os usuarios odeiam o episodio, tendem a acessar mais o IMDB para 
      deixar seu voto."),
    p("Outra avaliação, ainda analisando quantidade de 'haters' e quantidade de votações, podemos dizer
      que em The 100, após uma grande quantidade de episódios 'ruins', houve grande queda de votos no 
      IMDB e alta nas notas recebidas, podendo nos levar a conclusões do tipo: muitas pessoas deixaram 
      de assistir a série, e quem persistiu assitindo é porque realmente adorava a série e continuou 
      votando com notas altas nos episódios seguintes."),
    br(),
    p("Você leitor também pode utilizar os filtros como preferir e tirar suas próprias conclusões.")
  )
))