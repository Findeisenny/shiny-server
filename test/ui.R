
library(shiny)
ui <- fluidPage(
  sliderInput(inputId = "num",
              label = "Choose the number of points",
              value = 100, min = 10, max = 300),
  numericInput(inputId = "numzwei",
               label = "Choose the number of cluster",
               value = 2, min = 2, max = 9),
  sliderInput(inputId = "numdrei",
              label = "Choose the standard deviation",
              value = 0.3, min = 0.0, max = 2.0, step= 0.1),
  plotOutput("hist")
)

