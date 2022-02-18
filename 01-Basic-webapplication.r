library(shiny)
library(shinythemes)
library(bslib)

ui<- fluidPage(theme = bs_theme(version = 4, bootswatch = "minty"),
               navbarPage(
                 "My First app",
                 tabPanel("Full name",
                          sidebarPanel(
                            tags$h3("Input:"),
                            textInput("txt1","Given Name:",""),
                            textInput("txt2","Surname:",""),
                          ),
                          mainPanel(
                            h3("This is your name"),
                            h4("Output 1"),
                            verbatimTextOutput("txtout"),
                          )
                          ),
                 tabPanel("Next step", "This panel is intentionally left blank"),
                 tabPanel("Next step", "This panel is intentionally left blank")
               )
               )
server <- function(input,output){
  output$txtout <- renderText(
    {paste(input$txt1,input$txt2,sep = " ")}
  )
}

shinyApp(ui=ui,server = server)