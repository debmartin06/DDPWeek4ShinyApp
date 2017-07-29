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
      tabsetPanel(
        tabPanel("Main",
          h3("Species Prediction:"), 
          textOutput("SpeciesPredict"),
          plotOutput("LengthPlot"),
          plotOutput("WidthPlot")      
                 ),
        tabPanel("Help",
                 p("This app uses the iris dataset, and attempts to predict plant species by using inputs for sepal length, sepal width, petal length, and petal width."),
                 p("To begin, simply start changing the sliders on the left navigation bar, and watch as the black lines on the graphs change to show your values. Your species prediction will appear at the top of the screen.")
                 )
      )
      
    )
  )
))
