library(shiny)

shinyUI(fluidPage(

    headerPanel("Retail Library"),
    # titlePanel("                          Retail Library"),
    sidebarLayout(
        sidebarPanel(
            
            selectInput("Input1","Select the State",c("California"="California",
                                                      "Oregon"="Oregon", 
                                                      "Washington"="Washington",
                                                      "Arizona"="Arizona",
                                                      "Nevada"="Nevada"),selected ="California",selectize = TRUE )),
            sidebarPanel(h3("Selected State"),textOutput("text1"))
            
        ), 
        
        
        mainPanel(
            
                tabsetPanel(
                    #tabPanel("Summary",verbatimTextOutput('contents29')),
                    tabPanel("Location",h3(textOutput("text2"),plotOutput('contents4'),verbatimTextOutput('contents5'))),
                    tabPanel("Gender",h3(textOutput("text3"),plotOutput('contents2'),verbatimTextOutput('contents3'))),
                    tabPanel("MaritalStatus",h3(textOutput("text4"),plotOutput('contents10'),verbatimTextOutput('contents11'))),
                    tabPanel("OrderType",h3(textOutput("text5"),plotOutput('contents6'),verbatimTextOutput('contents7'))),
                    tabPanel("Education",h3(textOutput("text6"),plotOutput('contents12'),verbatimTextOutput('contents13'))))
            #  tabPanel("EmpStatus",plotOutput('contents14'),verbatimTextOutput('contents15')),
            # tabPanel("Loyalty",plotOutput('contents16'),verbatimTextOutput('contents17')),
            # tabPanel("Feedback",plotOutput('contents8'),verbatimTextOutput('contents9')))),
            # tabPanel("Dep",plotOutput('contents18'),verbatimTextOutput('contents19'))
    )
    )
)
          