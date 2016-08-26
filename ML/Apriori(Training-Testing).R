#Age
library(binr)
bins = 3
cutpoints<-quantile(I$Customer_Age,(0:bins)/bins)
Ages_binned <-cut(I$Customer_Age,cutpoints,include.lowest=TRUE)
I$Age_bin <- Ages_binned

#2006_payment   
bins = 3
cutpoints<-quantile(I$X2006_Payment,(0:bins)/bins)
Ages_binned <-cut(I$X2006_Payment,cutpoints,include.lowest=TRUE)
table(Ages_binned)
I$x2006_bin <- Ages_binned


#2007_payment 
bins = 3
cutpoints<-quantile(I$X2007_Payment,(0:bins)/bins)
Ages_binned <-cut(I$X2007_Payment,cutpoints,include.lowest=TRUE)
table(Ages_binned)
I$x2007_bin <- Ages_binned

#2008_payment 
bins = 3
cutpoints<-quantile(I$X2008_Payment,(0:bins)/bins)
Ages_binned <-cut(I$X2008_Payment,cutpoints,include.lowest=TRUE)
table(Ages_binned)
I$x2008_bin <- Ages_binned





dataset<-dataset[,-19]
#data-all variables are in factors
library(caret)
inTrain1<-createDataPartition(y=dataset$Policy_Status,p=0.60,list=F)
Traindata<-dataset[inTrain1,]
Testdata<-dataset[-inTrain1,]


#Apriori
dataset_Transactions<-as(Traindata, "transactions")

ins_apriori_rules<-apriori(dataset_Transactions, parameter = list(supp = 0.05, conf = 0.7,target = "rules")
                           ,appearance = list(rhs=c("Policy_Status=Lapsed","Policy_Status=In Force"),default="lhs"))
apriori_rules_df = data.frame(lhs = labels(lhs(ins_apriori_rules)),rhs = labels(rhs(ins_apriori_rules)),ins_apriori_rules@quality)
#generating rules
write.csv(apriori_rules_df,"C:/users/sujith.kumar/Desktop/rulessss.csv")

inspect(ins_apriori_rules)
test=Testdata[,-5]
test_Transactions<-as(test, "transactions")
LIST(test_Transactions)
#creating a variable
Testdata$REC = rep(0,times = length(test_Transactions))

#Predicting..
for(i in 1:length(test_Transactions)){
    basket = test_Transactions[i]
    rulesMatchLHS <- is.subset(ins_apriori_rules@lhs,basket)
    suitableRules <-  rulesMatchLHS & !(is.subset(ins_apriori_rules@rhs,basket))
    if(length(ins_apriori_rules[suitableRules])>0){
        recommendations <- strsplit(LIST(ins_apriori_rules[suitableRules]@rhs)[[1]],split=" ")
        recommendations <- lapply(recommendations,function(x){paste(x,collapse=" ")})
        recommendations <- as.character(recommendations)
        Testdata$REC[i] = recommendations
    }
    else
        Testdata$REC[i] = "In Force"
}
#Triming the variable
Testdata$REC<-substr(Testdata$REC,15,22)
#checking the accuarcy
#confusionMatrix(pred, truth)
confusionMatrix(Testdata$REC,Testdata$Policy_Status)



counts <- table(I$Occupation_Status)
A<-barplot(counts, main="Occupation_Status",col = c("blue","green","red"),legend.text =table(I$Occupation_Status), border = par("fg"),beside = TRUE)
text(A, counts, labels = counts, pos = 1.5)

counts <-table(Insout$Age_bin)
A<-barplot(counts, main="Age_bin",col =c("red", "yellow", "green"),legend.text =table(Insout$Age_bin), border = par("fg"),beside = TRUE,width = 0.85)
text(A,c("Middle Age","old Age","Adult"), labels = counts, pos = 3)
