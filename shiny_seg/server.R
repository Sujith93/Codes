S11<-read.csv("C:/Users/sujith.kumar/Desktop/shiny_seg/POS DataSet.csv")

shinyServer(function(input,output,session){
    
    
    data<-function(place){
        Niobraradata<-subset(S11,C.State == place)
        return(Niobraradata)
        
    }
 
    funct<-reactive({
        entity2<-data(input$Input1)
        
    })
output$contents29 <- renderPrint({
    
    
    summary(funct())
    
    
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
output$text1 <- renderText({paste("There are 5 States . You have selected ", input$Input1,".Based on this selection we identified the right segments of target customers on which we run mobile and email campaigns .")
    
})
output$text2 <- renderText({paste("Selected State is classified into 3 Categories , which shows the customer segmentation in each Category.")
    
})
output$text3 <- renderText({paste("Overall Spread of gender in that selected State.")
    
})
output$text4 <- renderText({paste("Customer Segments based on the martial status. ")
    
})
output$text5 <- renderText({paste("Segments showing the 7 different categories of Customer order ")
    
})
output$text6 <- renderText({paste(" Customers are segmented based on their Education Levels ")
    
})
})