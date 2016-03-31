setwd("C:\\Users\\murali.kommanaboina\\Desktop")
getwd()

S1<-read.csv("C:/Users/sujith.kumar/Desktop/shiny/POS_Final.csv")
S11<-read.csv("C:/Users/sujith.kumar/Desktop/shiny/POS DataSet.csv")
str(S11)
California<-subset(S11,  C.State == "California" )
Oregon<-subset(S11,  C.State == "Oregon" )
summary(California)
levels(California$C.Feedback)
table(California$C.Feedback)
plot(California$C.Feedback)
table(Oregon$C.Feedback)
plot(S11$C.Feedback)

table(S11$C.Education)
table(S11$C.Feedback)
table(S11$C.EmpStatus)
table(S11$C.Gender)

levels(S11$ProductCategory)
table(S11$ProductCategory)

CampingEquipment <- subset(S11, ProductCategory == "Camping Equipment" )
GolfEquipment<- subset(S11, ProductCategory == "Golf Equipment" )
MountaineeringEquipment<-subset(S11, ProductCategory == "Mountaineering Equipment") 
OutdoorProtection<-subset(S11, ProductCategory == "Outdoor Protection") 
PersonalAccessories<-subset(S11, ProductCategory == "Personal Accessories") 

levels(S11$OrderType)
table(S11$OrderType)

Email<- subset(S11, OrderType == "E-mail")
Fax<- subset(S11, OrderType == "Fax" )
Mail<-subset(S11, OrderType == "Mail") 
SalesVisit<-subset(S11, OrderType == "Sales visit") 
Special<-subset(S11, OrderType == "Special") 
Telephone<-subset(S11, OrderType == "Telephone") 
Web<-subset(S11, OrderType == "Web") 

plot(S11$OrderType)
table(S11$C.Gender)

Female<-subset(S11, C.Gender == "F")
Male<-subset(S11, C.Gender == "M")



# library(rattle)
# rattle()
# 
