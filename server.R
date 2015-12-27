
library(shiny)
devtools::install_github('rstudio/shinyapps')

coronaryDiseaseRisk <- function(badCholesterol, physicalActivity, 
                                bloodpressure) {
    risk <- 0
    
    if (badCholesterol > 120 & physicalActivity == 2) {
        risk <- 70
    } else if (badCholesterol < 120 & physicalActivity == 2) {
            risk <- 40
    } else if (badCholesterol > 120 & bloodpressure == 1) {
        risk <- 80
    } else if (badCholesterol < 120 & bloodpressure == 0 & 
               physicalActivity == 1) {
        risk <- 20
    } else if (physicalActivity == 3)
        risk <- 55
    else if (bloodpressure == 1)
        risk <- 60
    else 
        risk <- 50
    
    return (risk)
    
}
    

shinyServer(
    function(input, output) {
        
        output$badCholesterol <- renderPrint({input$badCholesterol})
        output$physicalActivity <- renderPrint({input$physicalActivity})
        output$bloodPressure <- renderPrint({input$bloodPressure})
        
        output$prediction <- renderPrint({coronaryDiseaseRisk(input$badCholesterol,
                                                        input$physicalActivity,
                                                        input$bloodpressure)})
    }
)