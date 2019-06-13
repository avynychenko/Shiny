library(shiny)

shinyServer(function(input, output) {
  output$out1 <- renderTable({head(mtcars, input$num1)})
  output$out2 <- renderText(input$box2)
  output$out3 <- renderText(input$box3)
})
