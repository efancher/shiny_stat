library(shiny)

shinyUI(fluidPage(
  
  # Application title
  titlePanel("Ridge and Lasso!"),
  
  # Sidebar with a slider input for alpha
  sidebarLayout(
    sidebarPanel(
      sliderInput("alpha",
                  "alpha:",
                  min = 0.0,
                  max = 1.0,
                  value = .2)
    ),
    
    mainPanel(
      plotOutput("plot1"),
      plotOutput("plot2")
    )
  )
))