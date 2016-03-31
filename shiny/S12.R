setwd("C:\\Users\\murali.kommanaboina\\Desktop")
getwd()

S12<-read.csv("C:\\Users\\murali.kommanaboina\\Desktop\\Murali\\NewDataset 1.csv")
str(S12)

table(S12$C.State)
plot(S12$C.State)

California<-subset(S12,  C.State == "California" )
Oregon<-subset(S12,  C.State == "Oregon" )
Arizona<-subset(S12,  C.State == "Arizona" )
Nevada<-subset(S12,  C.State == "Nevada" )
Washington<-subset(S12,  C.State == "Washington" )

table(California$C.Location)
table(Oregon$C.Location)
table(Arizona$C.Location)
table(Nevada$C.Location)
table(Washington$C.Location)

## Customer Segmentation Micro / Nano ##Arizona State 

Rural1<-subset(Arizona, C.Location == "Rural")
table(Rural1$C.Gender)
RFemale1<-subset(Rural1, C.Gender == "F")
RMale1<-subset(Rural1, C.Gender == "M")
table(RFemale1$C.MaritalStatus)
table(RMale1$C.MaritalStatus)
table(RFemale1$C.Education)
table(RMale1$C.Education)
table(RFemale1$C.EmpStatus)
table(RMale1$C.EmpStatus)
table(RFemale1$C.LoyaltyStatus)
table(RMale1$C.LoyaltyStatus)
table(RFemale1$OrderType)
table(RMale1$OrderType)


Suburban1<-subset(Arizona, C.Location == "Suburban")
table(Suburban1$C.Gender)
SFemale1<-subset(Suburban1, C.Gender == "F")
SMale1<-subset(Suburban1, C.Gender == "M")
table(SFemale1$C.MaritalStatus)
table(SMale1$C.MaritalStatus)
table(SFemale1$C.Education)
table(SMale1$C.Education)
table(SFemale1$C.EmpStatus)
table(SMale1$C.EmpStatus)
table(SFemale1$C.LoyaltyStatus)
table(SMale1$C.LoyaltyStatus)
table(SFemale1$OrderType)
table(SMale1$OrderType)


Urban1<-subset(Arizona, C.Location == "Urban")
table(Urban1$C.Gender)
UFemale1<-subset(Urban1, C.Gender == "F")
UMale1<-subset(Urban1, C.Gender == "M")
table(UFemale1$C.MaritalStatus)
table(UMale1$C.MaritalStatus)
table(UFemale1$C.Education)
table(UMale1$C.Education)
table(UFemale1$C.EmpStatus)
table(UMale1$C.EmpStatus)
table(UFemale1$C.LoyaltyStatus)
table(UMale1$C.LoyaltyStatus)
table(UFemale1$OrderType)
table(UMale1$OrderType)



##California
Rural2<-subset(California, C.Location == "Rural")
table(Rural2$C.Gender)
RFemale2<-subset(Rural2, C.Gender == "F")
RMale2<-subset(Rural2, C.Gender == "M")
table(RFemale2$C.MaritalStatus)
table(RMale2$C.MaritalStatus)
table(RFemale2$C.Education)
table(RMale2$C.Education)
table(RFemale2$C.EmpStatus)
table(RMale2$C.EmpStatus)
table(RFemale2$C.LoyaltyStatus)
table(RMale2$C.LoyaltyStatus)
table(RFemale2$OrderType)
table(RMale2$OrderType)

Suburban2<-subset(California, C.Location == "Suburban")
table(Suburban2$C.Gender)
SFemale2<-subset(Suburban2, C.Gender == "F")
SMale2<-subset(Suburban2, C.Gender == "M")
table(SFemale2$C.MaritalStatus)
table(SMale2$C.MaritalStatus)
table(SFemale2$C.Education)
table(SMale2$C.Education)
table(SFemale2$C.EmpStatus)
table(SMale2$C.EmpStatus)
table(SFemale2$C.LoyaltyStatus)
table(SMale2$C.LoyaltyStatus)
table(SFemale2$OrderType)
table(SMale2$OrderType)


Urban2<-subset(California, C.Location == "Urban")
table(Urban2$C.Gender)
UFemale2<-subset(Urban2, C.Gender == "F")
UMale2<-subset(Urban2, C.Gender == "M")
table(UFemale2$C.MaritalStatus)
table(UMale2$C.MaritalStatus)
table(UFemale2$C.Education)
table(UMale2$C.Education)
table(UFemale2$C.EmpStatus)
table(UMale2$C.EmpStatus)
table(UFemale2$C.LoyaltyStatus)
table(UMale2$C.LoyaltyStatus)
table(UFemale2$OrderType)
table(UMale2$OrderType)

##Nevada
Rural3<-subset(Nevada, C.Location == "Rural")
table(Rural3$C.Gender)
RFemale3<-subset(Rural3, C.Gender == "F")
RMale3<-subset(Rural3, C.Gender == "M")
table(RFemale3$C.MaritalStatus)
table(RMale3$C.MaritalStatus)
table(RFemale3$C.Education)
table(RMale3$C.Education)
table(RFemale3$C.EmpStatus)
table(RMale3$C.EmpStatus)
table(RFemale3$C.LoyaltyStatus)
table(RMale3$C.LoyaltyStatus)
table(RFemale3$OrderType)
table(RMale3$OrderType)

Suburban3<-subset(Nevada, C.Location == "Suburban")
table(Suburban3$C.Gender)
SFemale3<-subset(Suburban3, C.Gender == "F")
SMale3<-subset(Suburban3, C.Gender == "M")
table(SFemale3$C.MaritalStatus)
table(SMale3$C.MaritalStatus)
table(SFemale3$C.Education)
table(SMale3$C.Education)
table(SFemale3$C.EmpStatus)
table(SMale3$C.EmpStatus)
table(SFemale3$C.LoyaltyStatus)
table(SMale3$C.LoyaltyStatus)
table(SFemale3$OrderType)
table(SMale3$OrderType)

Urban3<-subset(Nevada, C.Location == "Urban")
table(Urban3$C.Gender)
UFemale3<-subset(Urban3, C.Gender == "F")
UMale3<-subset(Urban3, C.Gender == "M")
table(UFemale3$C.MaritalStatus)
table(UMale3$C.MaritalStatus)
table(UFemale3$C.Education)
table(UMale3$C.Education)
table(UFemale3$C.EmpStatus)
table(UMale3$C.EmpStatus)
table(UFemale3$C.LoyaltyStatus)
table(UMale3$C.LoyaltyStatus)
table(UFemale3$OrderType)
table(UMale3$OrderType)

##Oregon
Rural4<-subset(Oregon, C.Location == "Rural")
table(Rural4$C.Gender)
RFemale4<-subset(Rural4, C.Gender == "F")
RMale4<-subset(Rural4, C.Gender == "M")
table(RFemale4$C.MaritalStatus)
table(RMale4$C.MaritalStatus)
table(RFemale4$C.Education)
table(RMale4$C.Education)
table(RFemale4$C.EmpStatus)
table(RMale4$C.EmpStatus)
table(RFemale4$C.LoyaltyStatus)
table(RMale4$C.LoyaltyStatus)
table(RFemale4$OrderType)
table(RMale4$OrderType)

Suburban4<-subset(Oregon, C.Location == "Suburban")
table(Suburban4$C.Gender)
SFemale4<-subset(Suburban4, C.Gender == "F")
SMale4<-subset(Suburban4, C.Gender == "M")
table(SFemale4$C.MaritalStatus)
table(SMale4$C.MaritalStatus)
table(SFemale4$C.Education)
table(SMale4$C.Education)
table(SFemale4$C.EmpStatus)
table(SMale4$C.EmpStatus)
table(SFemale4$C.LoyaltyStatus)
table(SMale4$C.LoyaltyStatus)
table(SFemale4$OrderType)
table(SMale4$OrderType)

Urban4<-subset(Oregon, C.Location == "Urban")
table(Urban4$C.Gender)
UFemale4<-subset(Urban4, C.Gender == "F")
UMale4<-subset(Urban4, C.Gender == "M")
table(UFemale4$C.MaritalStatus)
table(UMale4$C.MaritalStatus)
table(UFemale4$C.Education)
table(UMale4$C.Education)
table(UFemale4$C.EmpStatus)
table(UMale4$C.EmpStatus)
table(UFemale4$C.LoyaltyStatus)
table(UMale4$C.LoyaltyStatus)
table(UFemale4$OrderType)
table(UMale4$OrderType)

##Washington

Rural5<-subset(Washington, C.Location == "Rural")
table(Rural5$C.Gender)
RFemale5<-subset(Rural5, C.Gender == "F")
RMale5<-subset(Rural5, C.Gender == "M")
table(RFemale5$C.MaritalStatus)
table(RMale5$C.MaritalStatus)
table(RFemale5$C.Education)
table(RMale5$C.Education)
table(RFemale5$C.EmpStatus)
table(RMale5$C.EmpStatus)
table(RFemale5$C.LoyaltyStatus)
table(RMale5$C.LoyaltyStatus)
table(RFemale5$OrderType)
table(RMale5$OrderType)

Suburban5<-subset(Washington, C.Location == "Suburban")
table(Suburban5$C.Gender)
SFemale5<-subset(Suburban5, C.Gender == "F")
SMale5<-subset(Suburban5, C.Gender == "M")
table(SFemale5$C.MaritalStatus)
table(SMale5$C.MaritalStatus)
table(SFemale5$C.Education)
table(SMale5$C.Education)
table(SFemale5$C.EmpStatus)
table(SMale5$C.EmpStatus)
table(SFemale5$C.LoyaltyStatus)
table(SMale5$C.LoyaltyStatus)
table(SFemale5$OrderType)
table(SMale5$OrderType)

Urban5<-subset(Washington, C.Location == "Urban")
table(Urban5$C.Gender)
UFemale5<-subset(Urban5, C.Gender == "F")
UMale5<-subset(Urban5, C.Gender == "M")
table(UFemale5$C.MaritalStatus)
table(UMale5$C.MaritalStatus)
table(UFemale5$C.Education)
table(UMale5$C.Education)
table(UFemale5$C.EmpStatus)
table(UMale5$C.EmpStatus)
table(UFemale5$C.LoyaltyStatus)
table(UMale5$C.LoyaltyStatus)
table(UFemale5$OrderType)
table(UMale5$OrderType)














































































































