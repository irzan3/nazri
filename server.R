
# This app is to help you choose the car that fit your requirements based on 
# the Transmission type, Number of Cylinders and the gross Horsepower using 
# mtcars dataset from R. 


library(shiny)
library(datasets)
library(dplyr)


shinyServer(function(input, output) {
  
  # Show the cars that correspond to the filters
  output$table <- renderDataTable({
  hp_seq <- seq(from = input$hp[1], to = input$hp[2], by = 1)
  data <- transmute(mtcars, Car = rownames(mtcars), Cylinders = cyl, 
                    Horsepower = hp, Transmission = am)
  
  data <- filter(data, Horsepower %in% hp_seq, Transmission %in% input$am,
                 Cylinders %in% input$cyl)
  data <- mutate(data, Transmission = ifelse(Transmission==0, "Automatic", "Manual"))
  data <- arrange(data, Horsepower)
  data
  }, options = list(lengthMenu = c(5, 15, 30), pageLength = 30))

}

)
