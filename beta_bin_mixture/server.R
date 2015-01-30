library(shiny)
#Posterior function
posterior = function(theta, alpha, beta){ 
  (theta^(alpha-1))*((1-theta)^(beta+9)) +
    10* (theta^(alpha  ))*((1-theta)^(beta+8)) +
    45* (theta^(alpha+1))*((1-theta)^(beta+7))
}
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  # Expression that generates a histogram. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should re-execute automatically
  #     when inputs change
  #  2) Its output type is a plot
  
  output$distPlot <- renderPlot({
    
    theta=seq(0,1,.01)
    alpha = input$alpha
    beta = input$beta
    iteg_c = 1/integrate(posterior, 0, 1, alpha=alpha, beta=beta)$value
    plot(theta,iteg_c*posterior(theta, alpha, beta), type="l")
    lines(theta, dbeta(theta,alpha,beta),col="red")
    mtext(bquote(list(alpha==.(alpha),beta==.(beta))))
    legend(x=0.8, y = 2.0, legend=c("proir","posterior"), text.col=c("red","black"))
    
  })
})
