
library(shiny)

shinyUI(fluidPage(
#     tags$body(
#         background="oil.jpg"
#         
#     ),
    
#    img(src='myImage.jpg', align = "left"),theme = "svs.css",
    
    titlePanel("     Media Mix Model"),
    sidebarLayout(
        sidebarPanel(
            sliderInput("Frequency","Amount spent($) :",min=1000,max=2000,value=1500,step=1)
            
            
        ), 
        
        mainPanel(h3(textOutput("text2")),
            
            plotOutput('contents3'),
            imageOutput("image2")



# tabsetPanel(
#     
#   
#       tabPanel(
#           "Simulation of Media Mix ",plotOutput('contents3'))
#     # tabPanel("Tv ",plotOutput('contents2')))
# )
)
)
)
)