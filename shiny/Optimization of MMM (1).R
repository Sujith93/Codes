
media <- read.csv("C:/Users/sujith.kumar/Desktop/shiny/media.csv")
View(media)
names(media)


##Assigning ADSTOCK VARIABLE
adstock_rate = 0.50


## ADSTOCK VARIABLES
adstocked_ads= filter(x=media$Ads, filter=adstock_rate, method="recursive")
adstocked_Ad_pages_Circulated = filter(x=media$Ad_pages_Circulated, filter=adstock_rate, method="recursive")
View(adstocked_Ad_pages_Circulated)



#PLOTTING GRAPH OF ABOVE VARIBALES
adstocked_ads_plot=plot(seq(1,length(media$Ads)), media$Ads, type="h", 
                        xlab="Time", ylab="Ads", 
                        ylim=c(0, max(c(media$Ads, adstocked_ads))), 
                        frame.plot=FALSE)
lines(adstocked_ads)

adstocked_Ad_pages_Circulated_plot=plot(seq(1,length(media$Ad_pages_Circulated)), media$Ad_pages_Circulated, type="h", 
                                        xlab="Time", ylab="Ads pages circulated", 
                                        ylim=c(0, max(c(media$Ad_pages_Circulated, adstocked_Ad_pages_Circulated))), 
                                        frame.plot=FALSE)
lines(adstocked_Ad_pages_Circulated)



####  Adjusting Adstock Variables into the origibal dataset
media$adstocked_ads=adstocked_ads
media$adstocked_Ad_pages_Circulated=adstocked_Ad_pages_Circulated
View(media)
str(media)



#ADJUSTING DATA SET BY REMOVING ADS & AD PAGES CIRCULATED
mediam=media[,-c(8,9)]
View(mediam)



##RUNNING MULTIPLE REGRESSION
mod1=lm(sales~.,data=mediam)
summary(mod1)
predictsales<-predict(mod1, mediam) 





## DEPENDING ON THE COEFICIENTS GIVING WEIGHTS AND OPTEMISING
radio_ads=1.55/38.06
tv_ads=1.06/38.06
online_ads =1.16/38.06
cost_per_ad=4.53/38.06
newpaper_ads =1.23/38.06
Magazine_Advertising_Spend  =7.89/38.06
Billboards =6.73/38.06
banner_ads = 9.44/38.06
search_ads =1.29/38.06
adstocked_ads=1.65/38.06
adstocked_Ad_pages_Circulated=(1.53/38.06)



#### DOING LPP FOR BUDGET ALLOCATION

install.packages("linprog")
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
