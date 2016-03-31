#S1<-read.csv("C:/Users/sujith.kumar/Desktop/shiny/POS_Final.csv")
library("shiny")
setwd("C:/Users/sujith.kumar/Desktop/shiny")

S11<-read.csv("C:/Users/sujith.kumar/Desktop/shiny/POS DataSet.csv")
media<-read.csv("C:/Users/sujith.kumar/Desktop/shiny/media1.csv")
dat <- read.csv("C:/Users/sujith.kumar/Desktop/shiny/clv1.csv")
high <- read.csv("C:/Users/sujith.kumar/Desktop/shiny/high.csv")
final <- read.csv("C:/Users/sujith.kumar/Desktop/shiny/finalubcf.csv")

#str(S11)
# California<-subset(S11,  C.State == "California" )
# Oregon<-subset(S11,  C.State == "Oregon" )


shinyServer(function(input,output,session){
    
    
    data<-function(place){
        Niobraradata<-subset(S11,C.State == place)
        return(Niobraradata)
        
 }
#    data1<-function(team){
#        Niobr<-subset(data() && RetailType == team)
#       return(Niobr)
#         }
    #     datasetInput <- reactive({
    #       
    #     })
   
#     funct1<-reactive({
#         entity3<-data1(input$Input2)
#         
#     })
#     
    
    data123<-function(place)
    {
        Niobraradata<-subset(dat,CustomerId==place)
        return(Niobraradata)
        
    }
    
    #output$contents <- renderPlot({  
    
    
    # ggplot(data1,aes(x=Year,y=prod)) + geom_line()  +ylab("Production") + facet_wrap(~Region)+theme_bw()
    
    
    #})
    datt<-function(place)
    {
        Niobraradata<-subset(high,CustomerId==place)
        return(Niobraradata)
        
    }
    
    dattaa<-function(place)
    {
        Niobraradata<-subset(final,C.ID==place)
        return(Niobraradata)
        
    }
    
    entity101<-reactive({
        
        entity<-dattaa(input$Customer_ID)
    })
    output$contents102 <- renderPrint({
        data2<-entity101()
        data1<-data2[,c(2,3,4)]
        data1
    })
    
    
    
    entity102<-reactive({
        
        entity<-datt(input$CustomerID)
    })
    
    
    
    
    entity200<-reactive({
        
        entity2<-data123(input$CustomerID)
    })
    
    
    
    output$contents101 <- renderPrint({
        data2<-entity102()
        data1<-data2[,c(1,2,3)]
        data1
        
    })
    
    output$contents100 <- renderPrint({
        data2<-entity200()
        data1<-data2[,c(3,4,6,11)]
        data1
    })
    
    
    
    
    
    
    
    
    
    
    
    
    
    funct<-reactive({
        entity2<-data(input$Input1)
        
    })
    output$contents29 <- renderPrint({
        
        
        summary(funct())
        
        
    })
    output$contents9 <- renderPrint({
        
        
        table(funct()$C.Feedback)
        
        
    })
    output$contents8 <- renderPlot({
        
        plot(funct()$C.Feedback)
        
        
    }) 
    output$contents7 <- renderPrint({
        
        
        table(funct()$OrderType)
        
        
    })
    output$contents6 <- renderPlot({
        
        plot(funct()$OrderType)
        
        
    })
    output$contents5 <- renderPrint({
        
        
        table(funct()$C.Location)
        
        
    })
    output$contents4 <- renderPlot({
        
        plot(funct()$C.Location)
        
        
    })
    output$contents3 <- renderPrint({
        
        
        table(funct()$C.Gender)
        
        
    })
    output$contents2 <- renderPlot({
        
        plot(funct()$C.Gender)
        
        
    })
    output$contents11 <- renderPrint({
        
        
        table(funct()$C.MaritalStatus)
        
        
    })
    output$contents10 <- renderPlot({
        
        plot(funct()$C.MaritalStatus)
        
        
    })
    output$contents13 <- renderPrint({
        
        
        table(funct()$C.Education)
        
        
    })
    output$contents12 <- renderPlot({
        
        plot(funct()$C.Education)
        
        
    })
    output$contents15 <- renderPrint({
        
        
        table(funct()$C.EmpStatus)
        
        
    })
    output$contents14 <- renderPlot({
        
        plot(funct()$C.EmpStatus)
        
        
    })
    output$contents17 <- renderPrint({
        
        
        table(funct()$C.LoyaltyStatus)
        
        
    })
    output$contents16 <- renderPlot({
        
        plot(funct()$C.LoyaltyStatus)
        
        
    })
    
    output$contents19 <- renderPrint({
        
        
        
        table(funct()$ProductCategory)
        
    })
    output$contents18 <- renderPlot({
        
       
        plot(funct()$ProductCategory)
        
        
    })
    output$contents21 <- renderPrint({
        
        
        
        table(funct()$RetailType)
        
    })
    output$contents20 <- renderPlot({
        
        
        plot(funct()$RetailType)
        
    })
    output$contents22 <- renderPrint({
        
        table(radio_ads=1.55/38.06)
        # table(tv_ads=1.06/38.06)
        
    })
    output$contents23 <- renderPrint({
        
        table(tv_ads=1.06/38.06)
        
    })
    output$contents24 <- renderPrint({
        
        table(online_ads =1.16/38.06)
        
    })
    output$contents25 <- renderPrint({
        
        table(Magazine_Advertising_Spend  =7.89/38.06)
        
    })
    output$contents26 <- renderPrint({
        
        table(newpaper_ads =1.23/38.06)
        
    })
    #     output$contents6 <- renderPrint({
    #         
    #         mod1=lm(sales~.,data=media)
    #         predictsales<-predict(mod1, media) 
    #         predictsales
    #         
    #         
    #     })
    output$contents27 <- renderPrint({
        mod1=lm(sales~.,data=media)
        predictsales<-predict(mod1, media)
        media<-cbind(media,predictsales)
        d<-media[,c(2,3,4,5,7,8,14)]
        d
    })
    output$contents28 <- renderPrint({
        library(linprog)
        
        
        roi=c(0.04,0.02,0.03,0.11,0.03,0.2,0.17,0.24,0.03,0.04,0.04)
        bvet=c(100000,0,0,0,0,0,0,0,0,0,0,0)
        Amat=rbind(
            c(1,1,1,1,1,1,1,1,1,1,1),
            c(0.96,-0.04,-0.04,-0.04,-0.04,-0.04,-0.04,-0.04,-0.04,-0.04,-0.04),
            c(-0.02,0.98,-0.02,-0.02,-0.02,-0.02,-0.02,-0.02,-0.02,-0.02,-0.02),
            c(-0.03,-0.03,0.97,-0.03,-0.03,-0.03,-0.03,-0.03,-0.03,-0.03,-0.03),
            c(-0.11,-0.11,-0.11,0.89,-0.11,-0.11,-0.11,-0.11,-0.11,-0.11,-0.11),
            c(-0.03,-0.03,-0.03,-0.03,0.97,-0.03,-0.03,-0.03,-0.03,-0.03,-0.03),
            c(-0.2,-0.2,-0.2,-0.2,-0.2,0.8,-0.2,-0.2,-0.2,-0.2,-0.2),
            c(-0.17,-0.17,-0.17,-0.17,-0.17,-0.17,0.83,-0.17,-0.17,-0.17,-0.17),
            c(-0.24,-0.24,-0.24,-0.24,-0.24,-0.24,-0.24,0.83,-0.24,-0.24,-0.24),
            c(-0.03,-0.03,-0.03,-0.03,-0.03,-0.03,-0.03,0.97,-0.03,-0.03,-0.03),
            c(-0.04,-0.04,-0.04,-0.04,-0.04,-0.04,-0.04,-0.04,-0.04,0.96,-0.04),
            c(-0.04,-0.04,-0.04,-0.04,-0.04,-0.04,-0.04,-0.04,-0.04,-0.04,0.96)
        )
        
        LP=solveLP(roi,bvet,Amat,TRUE)
        
        LP
        
    })
    
})

    
    

