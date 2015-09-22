library(shiny)
function(input, output) {
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