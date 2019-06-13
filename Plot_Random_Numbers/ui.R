# numericInput() ask user to enter a number from 1 to 1000 with step 1, default value is 1000, with message: "How many random numbers should be plotted?"
# sliderInput() ask user to choose min and max values from -100 till 100 with default position from -50 to 50
# checkboxInput() create checkbox with default value "TRUE" with questions to ask
# plotOutput("plot1") - show as result plot, which calls "plot1"
 
library(shiny)

shinyUI(fluidPage(
  titlePanel("Plot Random Numbers"),
  sidebarLayout(
    sidebarPanel(
      numericInput("numeric", "How many random numbers should be plotted?", value = 1000, min = 1, max = 1000, step = 1),
      sliderInput("sliderX", "Pick minimum and maximum X Values", -100, 100, value = c(-50, 50)),
      sliderInput("sliderY", "Pick minimum and maximum Y Values", -100, 100, value = c(-50, 50)),
      checkboxInput("show_xlab", "Show/Hide X Axis Label", value = TRUE),
      checkboxInput("show_ylab", "Show/Hide Y Axis Label", value = TRUE),
      checkboxInput("show_title", "Show/Hide Title")
    ),
    mainPanel(
      h3("Graph of Random Points"),
      plotOutput("plot1")
    )
  )
))