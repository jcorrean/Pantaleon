library(shiny)
i <- read.csv(file.choose())
ui <- fluidPage(
  varSelectInput("variable", "Variable:", i),
  plotOutput("data")
)

server <- function(input, output) {
  output$data <- renderPlot({
    ggplot(i, aes(!!input$variable)) + geom_histogram(fill = "blue") + theme_dark()
  })
}

shinyApp(ui, server)
