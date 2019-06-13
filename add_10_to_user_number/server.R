
# Here should be "shinyServer" function, which send commands to SERVER


library(shiny)

shinyServer(function(input, output) {
  output$text1 = renderText(input$slider2 + 10)     # output calls "text1" will show user's input ("input$slider2") plus 10
                                                    # renderText() in other words "display text"
  
})