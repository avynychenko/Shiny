library(shiny)

mycss <- "
.irs-bar,
.irs-bar-edge,
.irs-single,
.irs-grid-pol {
background: #008B8B;
border-color: #FFF8DC;}
.irs-grid-text { font-size: 10pt; }
# .irs-line {border: 1px solid black; height: 40px; border-radius: 0px;}
.irs-max {font-size: 12pt; }
.irs-min {font-size: 12pt; }
.pretty {pretty--color-success: red; }
"


shinyUI(fluidPage(
  tags$style(mycss),
  titlePanel("Predict Horsepower from MPG"),
  sidebarLayout(
        mainPanel(
       plotOutput("plot1"),
       h3("Predicted Horsepower from Model 1:"),
       textOutput("pred1"),
       h3("Predicted Horsepower from Model 2:"),
       textOutput("pred2")
    ),
    sidebarPanel(
      sliderInput("sliderMPG", "What is the MPG of the car?", 10, 35, value = 20, animate = TRUE),
      prettyCheckbox("showModel1", "Show/Hide Model 1", value = T,  status = "success", outline = TRUE, shape = "curve", bigger = T),
      prettyCheckbox("showModel2", "Show/Hide Model 2", value = T, status = "success", outline = TRUE, shape = "curve", bigger = T),
      actionButton("button", "Press Submit", style = "color: #FFF8DC; 
                     background-color: #008B8B; 
                     position: relative; 
                     left: 20%;                ## this option moves button 
                     height: 35px;
                     width: 120px;
                     text-align:center;
                     text-indent: -2px;
                     border-radius: 6px;
                     border-width: 2px")
      # submitButton("Press Submit")   # add "submit button" to press it when all inputs inserted
    )
  )
))
