library(shiny)

calculatedBMI <- function(weight, heightFeet, heightInches) {
  # English BMI Formula
  # BMI = ( weight in pounds / (height in inches x height in inches)) x 703
  # Metric BMI formula
  # BMI = ( weight in kg / (height in meters x height in meters))
  heightInInches <- heightFeet*12.0 + heightInches
  return ((weight / (heightInInches * heightInInches)) * 703.0)
}

totalHeightInInches <- function( feet, inches) {
  return( feet*12.0 + inches)
}
shinyServer( 
  function(input, output) {
  output$inputWeight <- renderPrint({input$weight})
  output$height1 <- renderText({ 
    paste("A person with a height of ")
  })
  output$height2 <- renderText({ 
    paste(input$heightFeet, "feet and ", input$heightInches,"inches,")
  })
  output$weight <- renderText({ 
    paste("and a weight of ",
          input$weight, "pounds")
  })

  output$bmiText <- renderText({
    paste("has a Body Mass Index")
  })
  output$bmiValue <- renderText({
    paste("BMI = ", calculatedBMI(input$weight, input$heightFeet, input$heightInches))
  })
  }
  )

