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
  library(glmnet)
  library(rgl)
  load("hiv.rda")
  X=hiv.train$x
  Y=hiv.train$y
  X_0 = hiv.test$x
  Y_0 = hiv.test$y
  
  output$plot1 <- renderPlot({
    

    
    
    ridge.out = cv.glmnet(x=X, y=Y, family="gaussian", alpha=input$alpha)
    plot(ridge.out$lambda,ridge.out$cvm,
         xlab='lambda',ylab='CV error',main='Ridge',type='l')
    lambda_min_cvm=ridge.out$lambda[which.min(ridge.out$cvm)]
    abline(v=lambda_min_cvm, col="blue")
  })
  output$plot2 <- renderPlot({
    ridge.out = cv.glmnet(x=X, y=Y, family="gaussian", alpha=input$alpha)
    plot(ridge.out)
  })
})
