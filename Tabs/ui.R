library(shiny)

shinyUI(fluidPage(
  titlePanel("Tabs!"),
  sidebarLayout(
    sidebarPanel(
      numericInput("num1", "Enter Number of observations:", value = 20, min = 1, max = 40, step = 1),
      textInput("box2", "Enter Tab 2 Text:", value = "Tab 2!"),
      textInput("box3", "Enter Tab 3 Text:", value = "Tab 3!")
    ),
    
   # br() adds a space between tabs and text (looks better)
    mainPanel(
       tabsetPanel(type = "tabs",
                   tabPanel("Data", br(), tableOutput("out1")),
                   tabPanel("Tab 2", br(), textOutput("out2")),
                   tabPanel("Tab 3", br(), textOutput("out3"))
                   )
    )
  )
))
