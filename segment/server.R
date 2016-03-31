S11<-read.csv("C:/Users/sujith.kumar/Desktop/segment/POS DataSet.csv")
S11<-S11[,-c(24:30)]
shinyServer(function(input,output,session){
    
    
    data<-function(place){
        Niobraradata<-subset(S11,C.State == place)
        return(Niobraradata)
        
    }
    
    data1<-function(place){
        Niobraradata<-subset(funct(),C.Location == place)
        return(Niobraradata)
        
    }
    data2<-function(place){
        Niobraradata<-subset(funct1(),C.Gender == place)
        return(Niobraradata)
        
    }
    data3<-function(place){
        Niobraradata<-subset(funct2(),C.MaritalStatus == place)
        return(Niobraradata)
        
    }
    data4<-function(place){
        Niobraradata<-subset(funct3(),C.Education == place)
        return(Niobraradata)
        
    }
      
    funct<-reactive({
        entity2<-data(input$Input1)
        
    })
    funct1<-reactive({
        entity3<-data1(input$Input2)
        
    })
    funct2<-reactive({
        entity3<-data2(input$Input3)
        
    })
    
    funct3<-reactive({
        entity3<-data3(input$Input4)
        
    })
    funct4<-reactive({
        entity3<-data4(input$Input5)
        
    })
    output$contents1 <- renderPrint({
        
        length(funct4()$C.ID)
        
        
    })
    output$text2 <- renderText({paste("Total number of Customers.")
        
    })
    output$contents2 <-  DT::renderDataTable({
        
        funct4()[,c(1,10,11,12,13,17,22)]
        
        
    })
#     output$contents2 <- renderPrint({
#         
#         
#         table(funct()$OrderType)
#         
#         
#     })

    
    
    
    
    
    
    
    
    
    
  })
