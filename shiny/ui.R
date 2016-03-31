library(shiny)

shinyUI(fluidPage(
    tags$body(
        background="s10.jpg"
        
    ),
    #tags$link(rel = "stylesheet", type = "text/css", href = "bootstrap.css"),

    #tags$head(tags$script("alert('Hello!');")),
    tags$head(tags$style("body{ color: blue; }")),
    tags$style(HTML("
      @import url('//fonts.googleapis.com/css?family=Lobster|Cabin:400,700');
                    
                    h1 {
                    font-family: 'Lobster', cursive;
                    font-weight: 500;
                    line-height: 1.1;
                    color: #48ca3b;
                    }
                    
                    ")),
    

  img(src='myImage.jpg', align = "right"),theme = "bootstrap.css",
  headerPanel("Retail Library"),
   # titlePanel("                          Retail Library"),
    sidebarLayout(
        sidebarPanel(
            
            selectInput("Input1","Select the State",c("California"="California",
                                                        "Oregon"="Oregon", 
                                                        "Washington"="Washington",
                                                        "Arizona"="Arizona",
                                                        "Nevada"="Nevada"),selected ="California",selectize = TRUE ),
            
#             selectInput("Input2","Select the RetailType",c("Department Store"="Department Store",
#                                                                 "Direct Marketing"="Direct Marketing",
#                                                                 "Equipment Rental Store"="Equipment Rental Store",
#                                                                 "Eyewear Store"="Eyewear Store",
#                                                                 "Golf Shop"="Golf Shop",
#                                                            "Outdoors Shop" ="Outdoors Shop",
#                                                            "Sports Store" = "Sports Store",
#                                                            "Warehouse Store" = "Warehouse Store"),selected ="Department Store",selectize = TRUE ),
            radioButtons("Select", label = h3("Select the model"),
                         choices = list("Segmentaion" = 1,"Welcome/New" = 2 ,"POS"= 3,"Media Mix" = 4, "Recomendation" = 5), 
                         selected = 1),
               textInput("CustomerID", label = h3("Customer-ID"), value = ""),
               textInput("Customer_ID", label = h3("Customer_ID"), value = "")
            
         
                             
            
        ), 
        
        mainPanel(
                             conditionalPanel(
                                 condition = "input.Select == '1'",
                                 tabsetPanel(
                                 tabPanel("Summary",verbatimTextOutput('contents29')),
                                 tabPanel("Location",plotOutput('contents4'),verbatimTextOutput('contents5')),
                                 tabPanel("Gender",plotOutput('contents2'),verbatimTextOutput('contents3')),
                                 tabPanel("C.MaritalStatus",plotOutput('contents10'),verbatimTextOutput('contents11')),
                                 tabPanel("OrderType",plotOutput('contents6'),verbatimTextOutput('contents7')),
                                 tabPanel("Education",plotOutput('contents12'),verbatimTextOutput('contents13')))),
                               #  tabPanel("EmpStatus",plotOutput('contents14'),verbatimTextOutput('contents15')),
                                # tabPanel("Loyalty",plotOutput('contents16'),verbatimTextOutput('contents17')),
                                # tabPanel("Feedback",plotOutput('contents8'),verbatimTextOutput('contents9')))),
                                # tabPanel("Dep",plotOutput('contents18'),verbatimTextOutput('contents19'))
                                 
                                 conditionalPanel(
                                    condition = "input.Select == '2'",
                                   tabsetPanel(
                                      tabPanel("Department",plotOutput('contents18'),verbatimTextOutput('contents19')),
                                      tabPanel("Loyalty",plotOutput('contents16'),verbatimTextOutput('contents17')),
                                      tabPanel("RetailType",plotOutput('contents20'),verbatimTextOutput('contents21')))),
                             conditionalPanel(
                                 condition = "input.Select == '3'",
                                 tabsetPanel(
                                     tabPanel("EmpStatus",plotOutput('contents14'),verbatimTextOutput('contents15')),
                                    # tabPanel("Loyalty",plotOutput('contents16'),verbatimTextOutput('contents17')),
                                     tabPanel("Feedback",plotOutput('contents8'),verbatimTextOutput('contents9')))),
                             conditionalPanel(
                                 condition = "input.Select == '4'",
                                 tabsetPanel(
                                     tabPanel("ROI",verbatimTextOutput('contents22'),verbatimTextOutput('contents23'),verbatimTextOutput('contents24'),
                                              verbatimTextOutput('contents25'),verbatimTextOutput('contents26')),
                                     tabPanel("Predicted Values",verbatimTextOutput('contents27')),
                                     tabPanel("Optimization ",verbatimTextOutput('contents28')))),
                             conditionalPanel(
                                 condition = "input.Select == '5'",
                                 tabsetPanel(
                                     tabPanel("CLV",verbatimTextOutput('contents100')),
                                     tabPanel("Products",verbatimTextOutput('contents101')),
                                     tabPanel("Recommandation",verbatimTextOutput('contents102'))))
                             
    )
)
)

)





