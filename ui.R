library(shiny)

# you must cd to the directory with the ui.R and server.R files using rstudio and run runApp()
# to run the app


shinyUI(fluidPage(
  # Application title 
    titlePanel("Body Mass Index (BMI) Calculator"),
    h4("Instructions:"),
    h6("Body Mass Index (BMI) is a measure of body fat based on height and weight,"),
    h6("and is applicable to both men and women between the ages of 18 and 65."),
    h6("To calculate your Body Mass Index:"),
    h6("Step 1) Enter your height (in feet and inches) using the numeric input boxes below."),
    h6("Step 2) Enter your weight (in pounds) using the numeric input box below."),
    h6("Step 3) Click on the 'Submit' button and your Body Mass Index will be calculated"),
    h6("and displayed to the right."),


    fluidRow(
      column(3,
        h3('User Input:'),
        numericInput('heightFeet', 'Height (feet):', 5, min = 3, max = 7, step = 1),
        numericInput('heightInches', 'Height (inches):', 11, min = 0, max = 11, step = 1),
        numericInput('weight', 'Weight: (pounds)', 180, min = 50, max = 300, step = 1), 
        submitButton('Submit')
        ), 
      column(3,
        h3('BMI Results:'),
        textOutput("height1"),
        textOutput("height2"),
        textOutput("weight"),
        textOutput("bmiText"),
        textOutput("bmiValue")
      ),
      column(3,
             h4('BMI Classification:'),
             h5('less than 18.5 -- Underweight'),
             h5('18.5 to 24.99 -- Normal Weight'),
             h5('25 to 29.99 -- Overweight'),
             h5('30 to 34.99 -- Obesity (Class 1)'),
             h5('35 to 39.99 -- Obesity (Class 2)'),
             h5('over 39.99 -- Morbid Obesity')
      )
    )
  )
)
