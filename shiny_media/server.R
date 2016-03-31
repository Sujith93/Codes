library("shiny")
setwd("C:/Users/sujith.kumar/Desktop/shiny_media")
# media1 <- read.csv("C:/Users/sujith.kumar/Desktop/shiny_media/media1.csv")
# media1 <- media1[,-1]

shinyServer(function(input, output,session) {
    
    
    data<-function(freq)
    {
        
        Returns=matrix(c(0.8, 0.06, 0.9, 0.9,
                         0.2, 1, 1.05, 1, 1, 
                         1.1, 3, 1, 1.2, 3, 
                         1, 1.4, 3, 1.1), 
                       nrow=3, ncol=6, byrow=TRUE)
        
        ##Budget Allocation
        radio_ads=tv_ads=online_ads=newpaper_ads=Magazine_Advertising_Spend=Billboards=freq
        
        radio_adsOutcome=tv_adsOutcome=online_adsOutcome=newpaper_adsOutcome=Magazine_Advertising_SpendOutcome=BillboardsOutcome=
            rep(0, 200)
        
        ##We are preparing to conduct 1000 iterations
        
        sims = 1
        
        while (sims <=200) {
            
            ##We are dealing with a different looping construct to do 1000 simulations.  
            
            
            for (i in 1:10) {
                
                ##The exact outcome is modeled to be random
                
                Outcome = sample(1:3,1)
                
                radio_ads=Returns[Outcome,1]*radio_ads
                tv_ads=Returns[Outcome,2]*tv_ads
                online_ads=Returns[Outcome,3]*online_ads
                newpaper_ads=Returns[Outcome,4]*newpaper_ads
                Magazine_Advertising_Spend=Returns[Outcome,5]*Magazine_Advertising_Spend
                Billboards=Returns[Outcome,6]*Billboards
            }
            
            ##Let us store the results of the jth iteration as jth value in each array
            
            radio_adsOutcome[sims]=radio_ads
            tv_adsOutcome[sims]=tv_ads
            newpaper_adsOutcome[sims]=newpaper_ads
            online_adsOutcome[sims]=online_ads
            Magazine_Advertising_SpendOutcome[sims]=Magazine_Advertising_Spend
            BillboardsOutcome[sims]=Billboards
            
            ##Let us reinitialize and start a new iteration
            
            radio_ads=tv_ads=online_ads=newpaper_ads=Magazine_Advertising_Spend=Billboards=freq
            sims=sims+1
        }
        
        Averageradio_ads=median(radio_adsOutcome)
#         Averagetv_ads=median(tv_adsOutcome)
#         Averageonline_ads=median(online_adsOutcome)
#         Averagenewpaper_ads=median( newpaper_adsOutcome)
#         AverageMagazine_Advertising_Spend=median(Magazine_Advertising_SpendOutcome)
#         AverageBillboards=median(BillboardsOutcome)
#        
         return(Averageradio_ads)
#         
    }
    entity1<-reactive({
        
        entity1<-data(input$Frequency)}
    )
    entity2<-reactive({
        
        entity2<-data1(input$Frequency)}
    )
    entity3<-reactive({
        
        entity3<-data2(input$Frequency)}
    )
    entity4<-reactive({
        
        entity4<-data3(input$Frequency)}
    )
    entity5<-reactive({
        
        entity5<-data4(input$Frequency)}
    )
    entity6<-reactive({
        
        entity5<-data5(input$Frequency)}
    )
    data1<-function(freq)
    {
        
        Returns=matrix(c(0.8, 0.06, 0.9, 0.9,
                         0.2, 1, 1.05, 1, 1, 
                         1.1, 3, 1, 1.2, 3, 
                         1, 1.4, 3, 1.1), 
                       nrow=3, ncol=6, byrow=TRUE)
        
        ##Budget Allocation
        radio_ads=tv_ads=online_ads=newpaper_ads=Magazine_Advertising_Spend=Billboards=freq
        
        radio_adsOutcome=tv_adsOutcome=online_adsOutcome=newpaper_adsOutcome=Magazine_Advertising_SpendOutcome=BillboardsOutcome=
            rep(0, 200)
        
        ##We are preparing to conduct 1000 iterations
        
        sims = 1
        
        while (sims <=200) {
            
            ##We are dealing with a different looping construct to do 1000 simulations.  
            
            
            for (i in 1:10) {
                
                ##The exact outcome is modeled to be random
                
                Outcome = sample(1:3,1)
                
                radio_ads=Returns[Outcome,1]*radio_ads
                tv_ads=Returns[Outcome,2]*tv_ads
                online_ads=Returns[Outcome,3]*online_ads
                newpaper_ads=Returns[Outcome,4]*newpaper_ads
                Magazine_Advertising_Spend=Returns[Outcome,5]*Magazine_Advertising_Spend
                Billboards=Returns[Outcome,6]*Billboards
            }
            
            ##Let us store the results of the jth iteration as jth value in each array
            
            radio_adsOutcome[sims]=radio_ads
            tv_adsOutcome[sims]=tv_ads
            newpaper_adsOutcome[sims]=newpaper_ads
            online_adsOutcome[sims]=online_ads
            Magazine_Advertising_SpendOutcome[sims]=Magazine_Advertising_Spend
            BillboardsOutcome[sims]=Billboards
            
            ##Let us reinitialize and start a new iteration
            
            radio_ads=tv_ads=online_ads=newpaper_ads=Magazine_Advertising_Spend=Billboards=freq
            sims=sims+1
        }
        Averagetv_ads=median(tv_adsOutcome)
        
    }
    data2<-function(freq)
    {
        
        Returns=matrix(c(0.8, 0.06, 0.9, 0.9,
                         0.2, 1, 1.05, 1, 1, 
                         1.1, 3, 1, 1.2, 3, 
                         1, 1.4, 3, 1.1), 
                       nrow=3, ncol=6, byrow=TRUE)
        
        ##Budget Allocation
        radio_ads=tv_ads=online_ads=newpaper_ads=Magazine_Advertising_Spend=Billboards=freq
        
        radio_adsOutcome=tv_adsOutcome=online_adsOutcome=newpaper_adsOutcome=Magazine_Advertising_SpendOutcome=BillboardsOutcome=
            rep(0, 200)
        
        ##We are preparing to conduct 1000 iterations
        
        sims = 1
        
        while (sims <=200) {
            
            ##We are dealing with a different looping construct to do 1000 simulations.  
            
            
            for (i in 1:10) {
                
                ##The exact outcome is modeled to be random
                
                Outcome = sample(1:3,1)
                
                radio_ads=Returns[Outcome,1]*radio_ads
                tv_ads=Returns[Outcome,2]*tv_ads
                online_ads=Returns[Outcome,3]*online_ads
                newpaper_ads=Returns[Outcome,4]*newpaper_ads
                Magazine_Advertising_Spend=Returns[Outcome,5]*Magazine_Advertising_Spend
                Billboards=Returns[Outcome,6]*Billboards
            }
            
            ##Let us store the results of the jth iteration as jth value in each array
            
            radio_adsOutcome[sims]=radio_ads
            tv_adsOutcome[sims]=tv_ads
            newpaper_adsOutcome[sims]=newpaper_ads
            online_adsOutcome[sims]=online_ads
            Magazine_Advertising_SpendOutcome[sims]=Magazine_Advertising_Spend
            BillboardsOutcome[sims]=Billboards
            
            ##Let us reinitialize and start a new iteration
            
            radio_ads=tv_ads=online_ads=newpaper_ads=Magazine_Advertising_Spend=Billboards=freq
            sims=sims+1
        }
        Averageonline_ads=median(online_adsOutcome)
        
    }
    data3<-function(freq)
    {
        
        Returns=matrix(c(0.8, 0.06, 0.9, 0.9,
                         0.2, 1, 1.05, 1, 1, 
                         1.1, 3, 1, 1.2, 3, 
                         1, 1.4, 3, 1.1), 
                       nrow=3, ncol=6, byrow=TRUE)
        
        ##Budget Allocation
        radio_ads=tv_ads=online_ads=newpaper_ads=Magazine_Advertising_Spend=Billboards=freq
        
        radio_adsOutcome=tv_adsOutcome=online_adsOutcome=newpaper_adsOutcome=Magazine_Advertising_SpendOutcome=BillboardsOutcome=
            rep(0, 200)
        
        ##We are preparing to conduct 1000 iterations
        
        sims = 1
        
        while (sims <=200) {
            
            ##We are dealing with a different looping construct to do 1000 simulations.  
            
            
            for (i in 1:10) {
                
                ##The exact outcome is modeled to be random
                
                Outcome = sample(1:3,1)
                
                radio_ads=Returns[Outcome,1]*radio_ads
                tv_ads=Returns[Outcome,2]*tv_ads
                online_ads=Returns[Outcome,3]*online_ads
                newpaper_ads=Returns[Outcome,4]*newpaper_ads
                Magazine_Advertising_Spend=Returns[Outcome,5]*Magazine_Advertising_Spend
                Billboards=Returns[Outcome,6]*Billboards
            }
            
            ##Let us store the results of the jth iteration as jth value in each array
            
            radio_adsOutcome[sims]=radio_ads
            tv_adsOutcome[sims]=tv_ads
            newpaper_adsOutcome[sims]=newpaper_ads
            online_adsOutcome[sims]=online_ads
            Magazine_Advertising_SpendOutcome[sims]=Magazine_Advertising_Spend
            BillboardsOutcome[sims]=Billboards
            
            ##Let us reinitialize and start a new iteration
            
            radio_ads=tv_ads=online_ads=newpaper_ads=Magazine_Advertising_Spend=Billboards=freq
            sims=sims+1
        }
        Averagenewpaper_ads=median( newpaper_adsOutcome)
        
    }
    data4<-function(freq)
    {
        
        Returns=matrix(c(0.8, 0.06, 0.9, 0.9,
                         0.2, 1, 1.05, 1, 1, 
                         1.1, 3, 1, 1.2, 3, 
                         1, 1.4, 3, 1.1), 
                       nrow=3, ncol=6, byrow=TRUE)
        
        ##Budget Allocation
        radio_ads=tv_ads=online_ads=newpaper_ads=Magazine_Advertising_Spend=Billboards=freq
        
        radio_adsOutcome=tv_adsOutcome=online_adsOutcome=newpaper_adsOutcome=Magazine_Advertising_SpendOutcome=BillboardsOutcome=
            rep(0, 200)
        
        ##We are preparing to conduct 1000 iterations
        
        sims = 1
        
        while (sims <=200) {
            
            ##We are dealing with a different looping construct to do 1000 simulations.  
            
            
            for (i in 1:10) {
                
                ##The exact outcome is modeled to be random
                
                Outcome = sample(1:3,1)
                
                radio_ads=Returns[Outcome,1]*radio_ads
                tv_ads=Returns[Outcome,2]*tv_ads
                online_ads=Returns[Outcome,3]*online_ads
                newpaper_ads=Returns[Outcome,4]*newpaper_ads
                Magazine_Advertising_Spend=Returns[Outcome,5]*Magazine_Advertising_Spend
                Billboards=Returns[Outcome,6]*Billboards
            }
            
            ##Let us store the results of the jth iteration as jth value in each array
            
            radio_adsOutcome[sims]=radio_ads
            tv_adsOutcome[sims]=tv_ads
            newpaper_adsOutcome[sims]=newpaper_ads
            online_adsOutcome[sims]=online_ads
            Magazine_Advertising_SpendOutcome[sims]=Magazine_Advertising_Spend
            BillboardsOutcome[sims]=Billboards
            
            ##Let us reinitialize and start a new iteration
            
            radio_ads=tv_ads=online_ads=newpaper_ads=Magazine_Advertising_Spend=Billboards=freq
            sims=sims+1
        }
        AverageMagazine_Advertising_Spend=median(Magazine_Advertising_SpendOutcome)
        
    }
    data5<-function(freq)
    {
        
        Returns=matrix(c(0.8, 0.06, 0.9, 0.9,
                         0.2, 1, 1.05, 1, 1, 
                         1.1, 3, 1, 1.2, 3, 
                         1, 1.4, 3, 1.1), 
                       nrow=3, ncol=6, byrow=TRUE)
        
        ##Budget Allocation
        radio_ads=tv_ads=online_ads=newpaper_ads=Magazine_Advertising_Spend=Billboards=freq
        
        radio_adsOutcome=tv_adsOutcome=online_adsOutcome=newpaper_adsOutcome=Magazine_Advertising_SpendOutcome=BillboardsOutcome=
            rep(0, 200)
        
        ##We are preparing to conduct 1000 iterations
        
        sims = 1
        
        while (sims <=200) {
            
            ##We are dealing with a different looping construct to do 1000 simulations.  
            
            
            for (i in 1:10) {
                
                ##The exact outcome is modeled to be random
                
                Outcome = sample(1:3,1)
                
                radio_ads=Returns[Outcome,1]*radio_ads
                tv_ads=Returns[Outcome,2]*tv_ads
                online_ads=Returns[Outcome,3]*online_ads
                newpaper_ads=Returns[Outcome,4]*newpaper_ads
                Magazine_Advertising_Spend=Returns[Outcome,5]*Magazine_Advertising_Spend
                Billboards=Returns[Outcome,6]*Billboards
            }
            
            ##Let us store the results of the jth iteration as jth value in each array
            
            radio_adsOutcome[sims]=radio_ads
            tv_adsOutcome[sims]=tv_ads
            newpaper_adsOutcome[sims]=newpaper_ads
            online_adsOutcome[sims]=online_ads
            Magazine_Advertising_SpendOutcome[sims]=Magazine_Advertising_Spend
            BillboardsOutcome[sims]=Billboards
            
            ##Let us reinitialize and start a new iteration
            
            radio_ads=tv_ads=online_ads=newpaper_ads=Magazine_Advertising_Spend=Billboards=freq
            sims=sims+1
        }
        AverageBillboards=median(BillboardsOutcome)
        
    }
#     Ar<-reactive({
#         
#         entity2()
#         Averageradio_ads=median(radio_adsOutcome)
#         return(Averageradio_ads)
#     }
#     )
    output$contents3 <- renderPlot({
        
        bp<-barplot(c(entity1(),entity2(),entity3(),entity4(),entity5(),entity6())
                         ,names.arg=c(" radio_ads","tv_ads", "online_ads","newpaper_ads","Magazine_Advertising_Spend","Billboards"),
                                col=c("red", "yellow", "green", "grey", "orange", "magenta"),main="Media Mix",legend.text = TRUE,
                                args.legend = list(title = "Sentiment", x = "topright", cex = 0.65))
        text(bp, 0, round(c(entity1(),entity2(),entity3(),entity4(),entity5(),entity6())),cex=1,pos=3) 
    
    
    })
    output$text2 <- renderText({paste("This shows the allocation in progress -  then the spend becomes more efficient in other channels and so is spent elsewhere in order to maximise marketing ROI..")
        
    })
    
    
    output$image2 <- renderImage({
        list(
                src = "C:/Users/sujith.kumar/Desktop/shiny_media/www/m7.jpg",
                filetype = "image/jpeg",
                alt = "This is a chainring"
            )
        
        

            }, deleteFile = FALSE)
})

    
    
#      output$contents2 <- renderPlot({
#         
#          
#          barplot(entity2(),col = "blue")
#                                                                                                                                                                                                                                                            
#          
#      })
    
   
     
