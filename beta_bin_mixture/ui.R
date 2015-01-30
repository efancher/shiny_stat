library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Hello Shiny!"),
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("alpha",
                  "alpha:",
                  min = 1,
                  max = 10,
                  value = 1),
      sliderInput("beta",
                  "beta:",
                  min = 1,
                  max = 10,
                  value = 1)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
  )
))