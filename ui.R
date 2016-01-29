
# This app is to help you choose the car that fit your requirements based on 
# the Transmission type, Number of Cylinders and the gross Horsepower using 
# mtcars dataset from R.

library(markdown)

shinyUI(navbarPage("Get your Dreamed Car",
          tabPanel("Table",
                            
            # Sidebar
            sidebarLayout(
              sidebarPanel(
                helpText("Choose the characteristics of your dreamed car:"),
                radioButtons('cyl', 'Number of Cylinders:', c("Four"=4, "Six"=6, "Eight"=8), selected = NULL),
                checkboxGroupInput('am', 'Transmission:', c("Automatic"=0, "Manual"=1), selected = c(0,1)),
                sliderInput('hp', 'Horsepower', min=50, max=350, value=c(50,350), step=10)
                          ),
                             
              mainPanel(
                dataTableOutput('table')
                        )
                            )
                   ),
          
          tabPanel("About",
              mainPanel(
                includeMarkdown("about.md")
                        )
                  )
    )
)   
