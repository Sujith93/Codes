setwd("C:\\Users\\murali.kommanaboina\\Desktop\\Murali")
getwd()

S1<-read.csv("C:\\Users\\murali.kommanaboina\\Desktop\\Murali\\Book1.csv")
S1$ZipCode = rep("",nrow(S1))
for(i in 1:nrow(S1)){
  if(S1$State[i] == "Arizona"){
    S1$ZipCode[i] = "85001"
  }
  else if(S1$State[i] == "California"){
    S1$ZipCode[i] = "90001"
  }
  else if(S1$State[i] == "Nevada"){
    S1$ZipCode[i] = "88901"
  }
  
  else if(S1$State[i] == "Oregon"){
    S1$ZipCode[i] = "97001"
  }
  else if(S1$State[i] == "Washington"){
    S1$ZipCode[i] = "98001"
  }
}

colnames(S1)<-c("C.ID","C.State","C.LoyaltyStatus","C.Education","C.EmpStatus","C.Gender","C.Income","C.Location","C.MaritalStatus","C.Mobile","C.Email","OrderType","RetailType","ProductCategory","ProductSubCategory","Product","Year","Quarter","TotalIncome","Quantity","GrossMargin", "C.Feedback", "ZipCode" )
str(S1)

## Bining Feedback
S1$Feedback1 = rep("",nrow(S1))
for(i in 1:nrow(S1)){
  if(S1$C.Feedback[i] == "Highly satisfied"){
    S1$Feedback1[i] = "3"
  }
  else if(S1$C.Feedback[i] == "Satisfied"){
    S1$Feedback1[i] = "2"
  }
  else if(S1$C.Feedback[i] == "Unsatisfied"){
    S1$Feedback1[i] = "1"
  }
  
  else if(S1$C.Feedback[i] == "Unknown"){
    S1$Feedback1[i] = "0"
  }
}

## Bining Gender 
S1$C.GenderBin<- ifelse(S1$C.Gender == "M" , 1 , 0)

## Binning Marital Status
S1$C.MaritalStatusBin = rep("",nrow(S1))
for(i in 1:nrow(S1)){
  if(S1$C.MaritalStatus[i] == "Divorced"){
    S1$C.MaritalStatusBin[i] = "3"
  }
  else if(S1$C.MaritalStatus[i] == "Married"){
    S1$C.MaritalStatusBin[i] = "2"
  }
  else if(S1$C.MaritalStatus[i] == "Single"){
    S1$C.MaritalStatusBin[i] = "1"
  }
}

## Bining Loyalty
S1$C.LoyaltyStatusBin = rep("",nrow(S1))
for(i in 1:nrow(S1)){
  if(S1$C.LoyaltyStatus[i] == "Premium"){
    S1$C.LoyaltyStatusBin[i] = "3"
  }
  else if(S1$C.LoyaltyStatus[i] == "Extended"){
    S1$C.LoyaltyStatusBin[i] = "2"
  }
  else if(S1$C.LoyaltyStatus[i] == "Basic"){
    S1$C.LoyaltyStatusBin[i] = "1"
  }
}

## Binning Education
S1$C.EducationBin = rep("",nrow(S1))
for(i in 1:nrow(S1)){
  if(S1$C.Education[i] == "Doctor"){
    S1$C.EducationBin [i] = "5"
  }
  else if(S1$C.Education[i] == "Master") {
    S1$C.EducationBin [i] = "4"
  }
  else if(S1$C.Education[i] == "Bachelor"){
    S1$C.EducationBin [i] = "3"
  }
  
  else if(S1$C.Education[i] == "College"){
    S1$C.EducationBin [i] = "2"
  }
  else if(S1$C.Education[i] == "High School or Below"){
    S1$C.EducationBin [i] = "1"
  }
}


## Binning Emp Status
S1$C.EmpstatusBin = rep("",nrow(S1))
for(i in 1:nrow(S1)){
  if(S1$C.EmpStatus[i] == "Retired"){
    S1$C.EmpstatusBin [i] = "5"
  }
  else if(S1$C.EmpStatus[i] == "Employed") {
    S1$C.EmpstatusBin[i] = "4"
  }
  else if(S1$C.EmpStatus[i] == "Medical Leave"){
    S1$C.EmpstatusBin [i] = "3"
  }
  
  else if(S1$C.EmpStatus[i] == "Unemployed"){
    S1$C.EmpstatusBin [i] = "2"
  }
  else if(S1$C.EmpStatus[i] == "Disabled"){
    S1$C.EmpstatusBin[i] = "1"
  }
}

## Binning Location
S1$C.LocationBin = rep("",nrow(S1))
for(i in 1:nrow(S1)){
  if(S1$C.Location[i] == "Urban"){
    S1$C.LocationBin[i] = "3"
  }
  else if(S1$C.Location[i] == "Suburban"){
    S1$C.LocationBin[i] = "2"
  }
  else if(S1$C.Location[i] == "Rural"){
    S1$C.LocationBin[i] = "1"
  }
}

S1$C.LoyaltyStatusBin<- as.factor(S1$C.LoyaltyStatusBin)
S1$C.EducationBin<-as.factor(S1$C.EducationBin)
S1$C.LocationBin<-as.factor(S1$C.LocationBin)
S1$C.EmpstatusBin<-as.factor(S1$C.EmpstatusBin)
S1$C.MaritalStatusBin<-as.factor(S1$C.MaritalStatusBin)

str(S1)

table(S1$C.LocationBin)
levels(S1$C.Location)
plot(S1$C.LocationBin)


##Multi Nomial regression model
library(nnet)
multi<-multinom(C.Feedback ~ C.EducationBin + C.EmpstatusBin + C.GenderBin + TotalIncome + OrderType+ C.MaritalStatusBin + C.LoyaltyStatusBin + C.LocationBin , data = S1)
cor(S1[,c()])
MultiNominal<-predict(multi)
plot(MultiNominal)



write.csv(S1, "C:\\Users\\murali.kommanaboina\\Desktop\\Murali\\NewDataset.csv")


library(rattle)
rattle()
