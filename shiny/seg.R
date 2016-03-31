
setwd("C:\\Users\\murali.kommanaboina\\Desktop\\Murali")
getwd()
seg<-read.csv("C:\\Users\\murali.kommanaboina\\Desktop\\Murali\\POS_Final.csv")
View(seg)

## subsetting Shopping_mode
Online_Shopping<-subset(seg, Shopping_Mode == "Online Shopping")
Offline_Shopping<-subset(seg, Shopping_Mode == "Offline Shopping")
Mobile_Phone<-subset(seg, Shopping_Mode == "Ordered through Mobile/Phone")

##Subsetting Customer Occupation
Employee<-subset(seg, C.Occupation == "Employee")
UnEmployee<-subset(seg, C.Occupation == "Un-Employee")
SelfEmployee<-subset(seg, C.Occupation == "Self-Employee")


##Subsetting Customer Marital Status
Married <-subset(seg, C.Marital_Status  == "Married")
Single <-subset(seg, C.Marital_Status  == "Single")

## Segmentation of Customers by Depending upon Quantity Purchased

Low_Level <-subset(seg, Quantity == 1|Quantity == 2|Quantity == 3)
Mid_Level <-subset(seg, Quantity == 4|Quantity == 5|Quantity == 6)
High_Level <-subset(seg, Quantity == 7|Quantity == 8|Quantity == 9)




