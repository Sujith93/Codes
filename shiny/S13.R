setwd("C:\\Users\\murali.kommanaboina\\Desktop")
getwd()

S13<-read.csv("C:\\Users\\murali.kommanaboina\\Desktop\\Murali\\NewDataset 1.csv")

View(S13)


table(California$RetailType)
table(Oregon$RetailType)


##Oregon

Dep_Store<-subset(Oregon, RetailType == "Department Store")
table(Dep_Store$ProductCategory)
Dir_Mar<-subset(Oregon, RetailType == "Direct Marketing")
table(Dir_Mar$ProductCategory)
Equip<-subset(Oregon, RetailType == "Equipment Rental Store")
table(Equip$ProductCategory)
Eye<-subset(Oregon, RetailType == "Eyewear Store")
table(Eye$ProductCategory)
Golf<-subset(Oregon, RetailType == "Golf Shop")
table(Golf$ProductCategory)
Out<-subset(Oregon, RetailType == "Outdoors Shop")
table(Out$ProductCategory)
Sport<-subset(Oregon, RetailType == "Sports Store")
table(Sport$ProductCategory)
Ware<-subset(Oregon, RetailType == "Warehouse Store")
table(Ware$ProductCategory)



