setwd("C:\\Users\\Sujith\\Desktop\\sujith")
getwd()

S1<- read.csv("C:\\Users\\Sujith\\Desktop\\Sujith\\Tata.csv")
View(S1)

S1<-S1[,-1]

S1$Customer.Id<-sample(4567:4767,200,replace = F)
## Car_Model
S1$Car.Model<-sample(1:11, 200, replace = T)
for(i in 1:nrow(S1)){
  if(S1$Car.Model[i] == 1){
    S1$Car.Model [i] = "Indica V2"
  }
  else  if(S1$Car.Model[i] == 2){
    S1$Car.Model[i] = "Indigo"
  }
  
  else  if(S1$Car.Model[i] == 3){
    S1$Car.Model[i]  = "Safari"
  }
  
  else if(S1$Car.Model[i] == 4){
    S1$Car.Model[i] = "Bolt"
  }
  else if(S1$Car.Model[i] == 5){
    S1$Car.Model[i] = "Zest"
  }
  else if(S1$Car.Model[i] == 6){
    S1$Car.Model[i] = "Aria"
  }
  else if(S1$Car.Model[i] == 7){
    S1$Car.Model[i] = "Nano"
  }
  else if(S1$Car.Model[i] == 8){
    S1$Car.Model[i] = "Sumo"
  }
  else if(S1$Car.Model[i] == 9){
    S1$Car.Model[i] = "Movus"
  }
  else if(S1$Car.Model[i] == 10){
    S1$Car.Model[i] = "Vista"
  }
  else if(S1$Car.Model[i] == 11){
    S1$Car.Model[i] = "Xenon"
  }
}

##Car-type
for(i in 1:nrow(S1)){
  if(S1$Car.Model[i] == "Indica V2" | S1$Car.Model[i] == "Bolt" | S1$Car.Model[i] == "Aria" | S1$Car.Model[i] == "Nano" | S1$Car.Model[i] == "Vista"){
    S1$Car.Type [i] = "Hatchback"
  }
  else  if(S1$Car.Model[i] == "Indigo" | S1$Car.Model[i] == "Zest" | S1$Car.Model[i] == "Xenon" ){
    S1$Car.Type[i] = "Sedan"
  }
  
  else  if(S1$Car.Model[i] == "Safari" | S1$Car.Model[i] == "Sumo" | S1$Car.Model[i] == "Movus" ){
    S1$Car.Type[i] = "SUV"
  }
  
}

##Date.of.Purchase

S1$Date.of.Purchase=as.Date(rep('1970-01-01',nrow(S1)))
for(i in 1:nrow(S1)){
  if(S1$Car.Model[i] == "Movus" | S1$Car.Model[i] == "Bolt" | S1$Car.Model[i] == "Zest"  | S1$Car.Model[i] == "Vista"){
    S1$Date.of.Purchase[i] = sample(seq(as.Date('2014-01-01'), as.Date('2016-01-01'), by="day"), 1 ,replace=TRUE)
  }
  else  if(S1$Car.Model[i] == "Aria" ){
    S1$Date.of.Purchase[i] = sample(seq(as.Date('2010-01-1'), as.Date('2016-01-01'), by="day"), 1 ,replace=TRUE)
  }
  else  if(S1$Car.Model[i] == "Nano"){
    S1$Date.of.Purchase[i] = sample(seq(as.Date('2012-01-01'), as.Date('2016-01-01'), by="day"), 1 ,replace=TRUE)
  }
  
  else  if(S1$Car.Model[i] == "Safari" ){
    S1$Date.of.Purchase[i] = sample(seq(as.Date('2005-01-01'), as.Date('2016-01-01'), by="day"), 1 ,replace=TRUE)
  }
  else  if(S1$Car.Model[i] == "Xenon" ){
    S1$Date.of.Purchase[i] = sample(seq(as.Date('2006-01-01'), as.Date('2016-01-01'), by="day"), 1 ,replace=TRUE)
  }
  else  if(S1$Car.Model[i] == "Indica V2" ){
    S1$Date.of.Purchase[i] = sample(seq(as.Date('1998-01-01'), as.Date('2016-01-01'), by="day"), 1 ,replace=TRUE)
  }
  else  if(S1$Car.Model[i] == "Sumo" ){
    S1$Date.of.Purchase[i] = sample(seq(as.Date('1994-01-01'), as.Date('2016-01-01'), by="day"), 1 ,replace=TRUE)
  }
  else if(S1$Car.Model[i] == "Indigo"){
    S1$Date.of.Purchase[i] = sample(seq(as.Date('2002-01-01'), as.Date('2016-01-01'), by="day"), 1 ,replace=TRUE)
  }
}

##Car.Age
S1$Car.Age<-as.numeric(difftime(as.Date('2016-01-01') ,S1$Date.of.Purchase , units = c("weeks")))
S1$Car.Age=round(S1$Car.Age/52)


## Total No.of Servicing

S1$Total.Number.of.Servicing<-sample(3:10,200,replace = T)

## Km.Reading.on.last.servicing
S1$Km.Reading.on.last.servicing<-sample(40000:80000,200,replace = F)

##Age
S1$Age<-sample(32:70, 200, replace = T)

for(i in 1:nrow(S1)){
  if(S1$Age[i] == 1){
    S1$Age[i] = "Maharastra"
  }
  else  if(S1$Age[i] == 2){
    S1$Age[i] = "NewDelhi"
  }
}

##Location states
S1$Locality..State....2....3.States...Max<-sample(1:2, 200, replace = T)

##Martial status
S1$Marital.Status<-sample(1:2, 200, replace = T)
for(i in 1:nrow(S1)){
  if(S1$Marital.Status[i] == 1){
    S1$Marital.Status [i] = "Married"
  }
  else  if(S1$Marital.Status[i] == 2){
    S1$Marital.Status[i] = "Un-Married"
  }
}

##Purchased.New.Car
S1$Purchased.New.Car<-sample(1:2, 200, replace = T)
for(i in 1:nrow(S1)){
  if(S1$Purchased.New.Car[i] == 1){
    S1$Purchased.New.Car [i] = "Yes"
  }
  else  if(S1$Purchased.New.Car[i] == 2){
    S1$Purchased.New.Car[i] = "No"
  }
}
S1$Customer.Income.Group<-sample(1:2, 200, replace = T)
for(i in 1:nrow(S1)){
  if(S1$Purchased.New.Car[i] == "Yes"){
    S1$Customer.Income.Group[i] = "high"
  }
  else  if(S1$Purchased.New.Car[i] == "No"){
    S1$Customer.Income.Group[i] = "Low"
  }
}
##Cost
for(i in 1:nrow(S1)){
  if(S1$Car.Model[i] == "Movus"){
    S1$Current.Market.Price.of.Car[i] = 7
  }
  else  if(S1$Car.Model[i] == "Aria" ){
    S1$Current.Market.Price.of.Car[i] = 12 
  }
  else  if(S1$Car.Model[i] == "Nano"){
    S1$Current.Market.Price.of.Car[i] = 2.5
  }
  else if(S1$Car.Model[i] == "Xenon"){
    S1$Current.Market.Price.of.Car[i] = 9.98
  }
  else  if(S1$Car.Model[i] == "Bolt" ){
    S1$Current.Market.Price.of.Car[i] = 7.1
  }
  else  if(S1$Car.Model[i] == "Zest"){
    S1$Current.Market.Price.of.Car[i] = 8.13
  }
  else  if(S1$Car.Model[i] == "Safari"){
    S1$Current.Market.Price.of.Car[i] = 12
  }
  else  if(S1$Car.Model[i] == "Vista" ){
    S1$Current.Market.Price.of.Car[i] = 5.5
  }
  else  if(S1$Car.Model[i] == "Sumo"){
    S1$Current.Market.Price.of.Car[i] = 8
  }
  else  if(S1$Car.Model[i] == "Indica V2"){
    S1$Current.Market.Price.of.Car[i] = 4.8
  }
  else  if(S1$Car.Model[i] == "Indigo"){
    S1$Current.Market.Price.of.Car[i] = 6.2
  }
  
}

##Last service
S1$Days.to.Last.Servicing<-sample(20:45,200,replace = T)

write.csv(S1, "C:\\Users\\Sujith\\Desktop\\Sujith\\Tata2.csv")

