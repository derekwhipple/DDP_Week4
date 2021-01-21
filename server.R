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
library(dplyr)
library(plotly)

shinyServer(function(input, output) {

    # content for plot UI component
    output$distPlot <- renderPlot({

        weights <- women[, 2]
        heights <- women[, 1]
        
        # get inputs from UI
        displayModelLine <- input$modelLine
        
        # create a data frame to use in the plot
        heightsAndWeights <- data.frame(heights, weights)
        gplot <- ggplot(heightsAndWeights, aes(heights, weights)) +
            geom_point()
        
        
        # if the option is true, create a smooth [regression-like] line
        if(displayModelLine == TRUE) {
            gplot <- gplot + stat_smooth()
        }
        
        # last thing to do is output the plot
        gplot

    })
    
    # content for predicted weight UI component
    output$weightOutput <- renderText({
        # Just use a simple linear model
        model <- lm(weights ~ heights, data = heightsAndWeights)
        inputValue <- as.numeric(input$predictValue)
        # use the coefficients of the model to calculate the predicted weight from the given height
        weightValue <- inputValue * model$coefficients[[2]] + model$coefficients[[1]]
        
        outputText <- paste("Predicted Weight:", as.character(weightValue))
        
    })

})
