
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

server <- function(input, output) {
  set.seed(20)
  a <- reactive({
    matrix(rnorm(input$num,  sd = input$numdrei), ncol = 2)
  })
  b <- reactive({
    matrix(rnorm(input$num, mean = 1, sd = input$numdrei), ncol = 2)
  })
  d <- reactive({
    input$numzwei
  })
  output$hist <- renderPlot({
    x <- rbind(a(), b())
    colnames(x) <- c("x", "y")
    (cl <- kmeans(x, d()))
    plot(x, col = cl$cluster)
    
  })
}
shinyApp(ui = ui, server = server)
