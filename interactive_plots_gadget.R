## This gadget is plotting data from "Tree dataset" on axis X is "Girth", on Y axis is "Volume"
# When user select with mouse a rectangle with points on scatter plot, and press button "Done", 
# after this in console appear a piece of data from dataset, that includes this chosen dots.


library(shiny)
library(miniUI)

pickTree <- function() {
  ui <- miniPage(
    gadgetTitleBar("Select Points by Dragging your Mouse"),
    miniContentPanel(
      plotOutput("plot", height = "100%", brush = "brush")
    )
  )
  server <- function(input, output, session) {
    output$plot <- renderPlot({
      plot(trees$Girth, trees$Volume, main = "Trees!", xlab = "Girth", ylab = "Volume")
    })
    observeEvent(input$done, {
      stopApp(brushedPoints(trees, input$brush, xvar = "Girth", yvar = "Volume"))
    })
  }
  runGadget(ui, server)
}

