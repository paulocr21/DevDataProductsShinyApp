
# Developing Data Products Shiny App

library(shiny)

shinyUI(pageWithSidebar(
    # Application title
    headerPanel("Coronary Disease Prediction"),
    
    sidebarPanel(
        numericInput(inputId = 'badCholesterol', 
                     label = 'Bad/LDL Cholesterol Level',
                     value = 90, min = 100, max = 1000, step = 10),

        radioButtons("physicalActivity", label = "Physical Activity",
                     choices = list("< 3 hours per week" = 1, 
                                    ">= 3 hours per week but not intense" = 2,
                                    "Very intense" = 3),selected = 1),
        h5("High Blood Pressure?"),
            checkboxInput(inputId = "bloodpressure", label = "Yes", 
                          value = TRUE),
        submitButton("Submit")
    ),
    
    mainPanel(
        h3('Result'),
        h4("According to your inputs, the chances are "),
        verbatimTextOutput("prediction")
        
    )
))