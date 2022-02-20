library(shiny)

data("airquality")


ui <- fluidPage(
  tags$head(
    # Note the wrapping of the string in HTML()
    tags$style(HTML("
      @import url('https://fonts.googleapis.com/css2?family=Prompt:wght@600&display=swap');
      body {
        background-color: white;
        color: black;}
      h2 {
        font-family: 'Prompt', sans-serif;
      }
      .shiny-input-container {
        font-family: 'Prompt', sans-serif;
        color: #474747;
      }"))
  ),
  
  titlePanel("Ozone level"),
  
  sidebarLayout(
    
    sidebarPanel(
      
      sliderInput(inputId = "bins",
                  label = "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30)
    ),
    mainPanel(
      plotOutput(outputId = "distPlot")
    )
  )
)

server <- function(input,output){
  output$distPlot <- renderPlot({
    x <- airquality$Ozone
    x <- na.omit(x)
    bins <- seq(min(x),max(x),length.out = input$bins + 1)
    hist(x,breaks = bins,col= "#75AADB",border = "black",
         xlab = "Ozone level",
         main = "Histogram of ozen level"        )
  })
}

shinyApp(ui= ui, server = server)


