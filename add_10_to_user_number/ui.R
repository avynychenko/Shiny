
# Here should be "shinyUI" function, which control USER INTERFACE
# fluidPage() just describes page type, which we want to create for user interface.This is kinda default.
# fluidPage() has 2 attributes: sidebarPanel() which controls what should be shown in sidebar and mainPanel().
# h3() - it is size of text like in HTML


library(shiny)

shinyUI(fluidPage(
  titlePanel("Slider App"),
  sidebarLayout(
    sidebarPanel(
      h1("Move the Slider!"),
      sliderInput("slider2", "Slide Me!", 0, 100, 0)   # name of slider is "slider2", text is: "Slide Me!" and it starts from 0 till 100, 
                                                       # and starting point is 0
    ),
    mainPanel(
      h3("Slider Value:"),
      h1(textOutput("text1"))
    )
  )
))

?builder
