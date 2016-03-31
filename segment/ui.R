library(shiny)

shinyUI(fluidPage(

headerPanel("Retail Library"),
# titlePanel("                          Retail Library"),
sidebarLayout(
sidebarPanel(
 
    selectizeInput("Input1","Select the State",choices =list("California"="California",
                                           "Oregon"="Oregon", 
                                           "Washington"="Washington",
                                           "Arizona"="Arizona",
                                           "Nevada"="Nevada") ),
    selectizeInput("Input2","Select the location",choices=list("Urban"="Urban",
                                           "Suburban"="Suburban", 
                                           "Rural"="Rural"
                                           ),multiple = TRUE ),
 
    selectizeInput("Input3","Select the Gender",choices=list("M"="M",
                                              "F"="F"
                                              
 ),multiple = TRUE ),
 selectizeInput("Input4","Select the MaritalStatus",choices =list("Single"="Single",
                                            "Married"="Married",
                                            "Divorced"="Divorced"
                                            
 ),multiple = TRUE ),

 selectizeInput("Input5","Select the Education",choices =list("Bachelor"="Bachelor",
                                            "Master"="Master",
                                            "College"="College",
                                            "High School or Below"="High School or Below",
                                            "Doctor"="Doctor"
                                            
 ),multiple = TRUE ),
 
 
# sidebarPanel(h3("Selected State"),textOutput("text1"))

submitButton("Submit")
),
 



mainPanel(
    h3(h3(textOutput("text2")), verbatimTextOutput('contents1'),DT::dataTableOutput('contents2'))
#,verbatimTextOutput('contents2'))

#         
#         "Location",h3(textOutput("text2"),plotOutput('contents4',width = "40%"),verbatimTextOutput('contents5')),
#         "Gender",h3(textOutput("text3"),plotOutput('contents2',width = "40%"),verbatimTextOutput('contents3')),
#         "MaritalStatus",h3(textOutput("text4"),plotOutput('contents10'),verbatimTextOutput('contents11')),
#         "OrderType",h3(textOutput("text5"),plotOutput('contents6'),verbatimTextOutput('contents7')),
#         "Education",h3(textOutput("text6"),plotOutput('contents12'),verbatimTextOutput('contents13'))
#         
)


)
)
)