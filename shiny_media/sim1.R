#Simulation for Media mix

##Let us define the returns matrix and initialize the investments at Rs. 1000
#As we do 1000 simulations again, we store them in arrays of same length

rm(list=ls(all=TRUE))


#ROI
Returns=matrix(c(0.8, 0.06, 0.9, 0.9,
                 0.2, 1, 1.05, 1, 1, 
                 1.1, 3, 1, 1.2, 3, 
                 1, 1.4, 3, 1.1), 
               nrow=3, ncol=6, byrow=TRUE)

##Budget Allocation
radio_ads=tv_ads=online_ads=newpaper_ads=Magazine_Advertising_Spend=Billboards=2000

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
  
  radio_ads=tv_ads=online_ads=newpaper_ads=Magazine_Advertising_Spend=Billboards=2000
  sims=sims+1
}

Averageradio_ads=median(radio_adsOutcome)
Averagetv_ads=median(tv_adsOutcome)
Averageonline_ads=median(online_adsOutcome)
Averagenewpaper_ads=median( newpaper_adsOutcome)
AverageMagazine_Advertising_Spend=median(Magazine_Advertising_SpendOutcome)
AverageBillboards=median(BillboardsOutcome)

bp<-barplot(c(Averageradio_ads,Averagetv_ads, Averageonline_ads,Averagenewpaper_ads,AverageMagazine_Advertising_Spend,AverageBillboards),names.arg=c(" radio_ads","tv_ads", "online_ads","newpaper_ads","Magazine_Advertising_Spend","Billboards"),col=c("red", "yellow", "green", "grey",
                                                                                                                                                                                                                                                     "orange", "magenta"),main="Existing spent in Medias ")

text(bp, 0, round(c(Averageradio_ads,Averagetv_ads, Averageonline_ads,Averagenewpaper_ads,AverageMagazine_Advertising_Spend,AverageBillboards)),cex=1,pos=3)















