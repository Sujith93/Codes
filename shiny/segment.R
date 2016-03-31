setwd("C:\\Users\\murali.kommanaboina\\Desktop\\Murali")
getwd()

## Clustering the Customer Vs Product Category

library(foreign)
library(memisc)
file.choose()
dataset = read.spss( "C:\\Users\\murali.kommanaboina\\Desktop\\Customer Vs  Product.sav", to.data.frame=TRUE)
dim(dataset)
write.csv(dataset,"C:\\Users\\murali.kommanaboina\\Desktop\\CustomerVsProduct.csv")


## Clustering the Customer Vs Amount Total Paid

library(foreign)
library(memisc)
file.choose()
dataset1 = read.spss("C:\\Users\\murali.kommanaboina\\Desktop\\Customer Vs Amount.sav", to.data.frame=TRUE)
dim(dataset1)
write.csv(dataset1,"C:\\Users\\murali.kommanaboina\\Desktop\\CustomerVsAmount.csv")


## Clustering the Customer Feedback

library(foreign)
library(memisc)
file.choose()
dataset2 = read.spss("C:\\Users\\murali.kommanaboina\\Desktop\\Murali\\Customer_Feedback.sav", to.data.frame=TRUE)
dim(dataset1)
write.csv(dataset2,"C:\\Users\\murali.kommanaboina\\Desktop\\MuraliCluster Data\\Customer_Feedback.csv")

POS<-read.csv("C:\\Users\\murali.kommanaboina\\Desktop\\Murali\\POS_Final.csv")
CP<-read.csv("C:\\Users\\murali.kommanaboina\\Desktop\\Murali\\Cluster Data\\CustomerVsProduct.csv")
CA<-read.csv("C:\\Users\\murali.kommanaboina\\Desktop\\Murali\\Cluster Data\\CustomerVsAmount.csv")

View(POS)
POS1<-POS
POS1=POS1[,-27]
POS1$Customer_Rating = rep("",nrow(POS1))
for(i in 1:nrow(POS1)){
  if(POS1$Customer_FeedBack[i] == "Excellent"){
    POS1$Customer_Rating[i] = "5"
  }
  else if(POS1$Customer_FeedBack[i] == "Good") {
    POS1$Customer_Rating[i] = "4"
  }
  else if(POS1$Customer_FeedBack[i] == "Average"){
    POS1$Customer_Rating[i] = "3"
  }
  
  else if(POS1$Customer_FeedBack[i] == "Satisfied"){
    POS1$Customer_Rating[i] = "2"
  }
  else if(POS1$Customer_FeedBack[i] == "Poor"){
    POS1$Customer_Rating[i] = "1"
  }
}

table(POS1$Customer_Rating)
plot(POS1$Customer_FeedBack)


##Subsetting the Customer FeedBack
Excellent<-subset(POS1, Customer_Rating == "5")
Good<-subset(POS1, Customer_Rating == "4")
Average<-subset(POS1, Customer_Rating == "3")
Satisfied<-subset(POS1, Customer_Rating == "2")
Poor<-subset(POS1, Customer_Rating == "1")

## Identification of Feedback Vs Occupation

table(Excellent$C.Occupation)
table(Good$C.Occupation)
table(Average$C.Occupation)
table(Satisfied$C.Occupation)
table(Poor$C.Occupation)

str(POS1)
Employee<-subset(POS1,C.Occupation =="Employee" )
SelfEmployee<-subset(POS1,C.Occupation == "Self-Employee" )
UnEmployee<-subset(POS1,C.Occupation =="Un-Employee" )
