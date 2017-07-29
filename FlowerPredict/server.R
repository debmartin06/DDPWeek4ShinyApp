#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(rpart)


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  predictspecies <- function(SL, SW, PL, PW) {
    fit <- rpart(Species ~ ., data = iris)
    newdata <- data.frame(SL, SW, PL, PW)
    colnames(newdata) <- c('Sepal.Length', 'Sepal.Width', 'Petal.Length', 'Petal.Width')
    prediction <- predict(fit, newdata)
    speciespred <- colnames(SpeciesPredict)[max.col(SpeciesPredict)]
    speciespred <- paste0(toupper(substr(speciespred, 1, 1)), tolower(substring(speciespred, 2)))
    speciespred
  }
  
  output$SpeciesPredict <- renderText({
      predictspecies(input$SepalLength, input$SepalWidth, input$PetalLength, input$PetalWidth)
    })
  
  output$WidthPlot <- renderPlot({
    
    qplot(Sepal.Width, Petal.Width, data = iris, col = Species) + 
      geom_vline(aes(xintercept = input$SepalWidth)) + 
      geom_hline(aes(yintercept = input$PetalWidth))
  })
  
  output$LengthPlot <- renderPlot({
    
    qplot(Sepal.Length, Petal.Length, data = iris, col = Species) +
      geom_vline(aes(xintercept = input$SepalLength)) +
      geom_hline(aes(yintercept = input$PetalLength))
    
  })
  
})
