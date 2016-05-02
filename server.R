#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

shinyServer(function(input, output) {
  output$solPlot <- renderPlot({
    library(robustbase)
    data(alcohol)
    alcohol_train <- alcohol[1:41,]
    alcohol_test <- alcohol[42:44,]
    myList <- list("alcohol 1" = alcohol_test[1,], "alcohol 2" = alcohol_test[2,], "alcohol 3" = alcohol_test[3,])
    model2 <- lm(logSolubility ~ ., data = alcohol_train)
    alcdud <- data.frame(myList[input$alcChoice])
    colnames(alcdud) <- c("SAG", "V", "logPC", "P", "RM", "Mass", "logSolubility")
    pred1 <- predict.lm(model2, alcdud)
    pred2 <- predict.lm(model2, alcohol_train)
    plot(pred2, alcohol_train$logSolubility, xlim = c(-15, 0), ylim = c(-15, 0), xlab = "Predicted Solubility", ylab = "Measured Solubility")
    points(pred1, alcdud$logSolubility, pch = 15, cex = 2, col = "red")
    
  })
}
)
