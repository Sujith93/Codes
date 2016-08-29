library(shiny)

shinyUI(fluidPage(
  tags$body(
    background="s10.jpg"
    
  ),
  #tags$link(rel = "stylesheet", type = "text/css", href = "bootstrap.css"),
  
  #tags$head(tags$script("alert('Hello!');")),
  tags$head(tags$style("body{ color: black; }")),
  tags$style(HTML("
      @import url('//fonts.googleapis.com/css?family=Lobster|Cabin:400,700');
                    
                    h1 {
                    font-family: 'Lobster', cursive;
                    font-weight: 500;
                    line-height: 1.1;
                    color: #48ca3b;
                    }
                    
                    ")),
  
  
  img(src='karvy-analytics.jpg', align = "right"),theme = "bootstrap.css",
  
  headerPanel("Star ratings"),
  # titlePanel("Retail Library"),
  sidebarLayout(
    sidebarPanel(
      
      selectInput("Input1","Select the State", c("PART C"="PART C",
                                                 "PART D"= "PART D",
                                                "MA PD"="MA PD"
                                                 ),selected ="PART C",selectize = TRUE ),
#       selectInput("Input11","Measures", c("Breast.Cancer.Screening"=2,
#                                          "Colorectal.Cancer.Screening"=3),selectize = TRUE ),
      conditionalPanel(
        condition = "input.Input1 == 'PART C'",
        selectInput("Input2","Select the State", c("H1651"="H1651",
                                                   "H2461"="H2461",
                                                   "H5256"="H5256",
                                                   "H5264"="H5264")),selected ="H1651",selectize = TRUE ),

      conditionalPanel(
        condition = "input.Input1 == 'PART D'",
        selectInput("Input3","Select the State", c("H0141"="H0141",
                                                   "H0901"="H0901",
                                                   "H1291"="H1291",
                                                   "H1419"="H1419")),selected ="H0141",selectize = TRUE ),
      conditionalPanel(
        condition = "input.Input1 == 'MA PD'",
        selectInput("Input4","Select the State", c("H0084"="H0084",
                                                   "H0104"="H0104",
                                                   "H0108"="H0108",
                                                   "H0117"="H0117")),selected ="H0084",selectize = TRUE ),
        selectInput("Input11","Measures", c("Breast.Cancer.Screening"=2,
                                    "Colorectal.Cancer.Screening"=3,
                                    "Cardiovascular.Care...Cholesterol.Screening"=4,
                                    "Diabetes.Care...Cholesterol.Screening"=5,
                                    "Glaucoma.Testing"=6,
                                    "Annual.Flu.Vaccine"=7,
                                    "Improving.or.Maintaining.Physical.Health"=8,
                                    "Improving.or.Maintaining.Mental.Health"=9,
                                    "Monitoring.Physical.Activity"=10,
                                    "Adult.BMI.Assessment"=11,
                                    "Care.for.Older.Adults...Medication.Review"=12,
                                    "Care.for.Older.Adults...Functional.Status.Assessment "=13,
                                    "Care.for.Older.Adults...Pain.Screening"=14,
                                    " Osteoporosis.Management.in.Women.who.had.a.Fracture "=15,
                                    "Diabetes.Care...Eye.Exam "=16,
                                    "Diabetes.Care...Kidney.Disease.Monitoring "=17,
                                    "Diabetes.Care...Blood.Sugar.Controlled"=18,
                                    "Diabetes.Care...Cholesterol.Controlled"=19,
                                    "Controlling.Blood.Pressure"=20),selectize = TRUE )
    ),
    
    
    mainPanel(
        
tabsetPanel(
tabPanel("Contract Details",
      conditionalPanel(
        condition = "input.Input1 == 'PART C'",
                           DT::dataTableOutput('contents2'),
                           plotOutput("contents5")),
      conditionalPanel(
        condition = "input.Input1 == 'PART D'",
                            DT::dataTableOutput('contents3'),
                             plotOutput("contents6")),
       conditionalPanel(
        condition = "input.Input1 == 'MA PD'",
                   
                      DT::dataTableOutput('contents4'),
                     plotOutput("contents7"))),
tabPanel("Measures Rating visualization",
         conditionalPanel(
             condition = "input.Input1 == 'PART C'",
             scatterD3Output("phonePlot1", height = "700px")),
         conditionalPanel(
             condition = "input.Input1 == 'PART D'",
             
             scatterD3Output("phonePlot2", height = "700px")),
         conditionalPanel(
             condition = "input.Input1 == 'MA PD'",
             
             scatterD3Output("phonePlot3", height = "700px"))),
tabPanel("Measures Rating",
         conditionalPanel(
             condition = "input.Input1 == 'PART C'",
             plotlyOutput("phonePlot4")),
         conditionalPanel(
             condition = "input.Input1 == 'PART D'",
             
             plotlyOutput("phonePlot5")),
         conditionalPanel(
             condition = "input.Input1 == 'MA PD'",
             
             plotlyOutput("phonePlot6"))
)
)
)
)
)
)
