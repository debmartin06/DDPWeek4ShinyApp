library(shiny)

# Define UI
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Flower Species Predictor"),
  
  # Sidebar
  sidebarLayout(
    sidebarPanel(
       sliderInput("SepalLength",
                   "Sepal Length:",
                   min = min(iris$Sepal.Length),
                   max = max(iris$Sepal.Length),
                   value = round(mean(iris$Sepal.Length), digits = 1),
                   step = 0.1),
       sliderInput("SepalWidth",
                   "Sepal Width:",
                   min = min(iris$Sepal.Width),
                   max = max(iris$Sepal.Width),
                   value = round(mean(iris$Sepal.Width), digits = 1),
                   step = 0.1),
       sliderInput("PetalLength",
                   "Petal Length:",
                   min = min(iris$Petal.Length),
                   max = max(iris$Petal.Length),
                   value = round(mean(iris$Petal.Length), digits = 1),
                   step = 0.1),
       sliderInput("PetalWidth",
                   "Petal Width:",
                   min = min(iris$Petal.Width),
                   max = max(iris$Petal.Width),
                   value = round(mean(iris$Petal.Width), digits = 1),
                   step = 0.1)
    ),
    
    # Show plots and prediction
    mainPanel(
      h3("Species Prediction:"), 
      textOutput("SpeciesPredict"),
      plotOutput("LengthPlot"),
      plotOutput("WidthPlot")
    )
  )
))
