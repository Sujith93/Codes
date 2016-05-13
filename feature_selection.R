#Taking the dataset
install.packages("UsingR")
library(UsingR)
library(dplyr)
data("fat")
View(fat)
attach(fat)
sapply(fat, function(x) sum(is.na(x)))
fat<-fat[,-c(1,2,4,17,18,19)]
str(fat)
fat$age<-as.numeric(fat$age)
#################################
#Linear Regression
a<-lm(formula=body.fat.siri~.,data = fat)
summary(a)
AIC(a)
mse <- mean(residuals(a)^2)
rmse <- sqrt(mse)
# Evaluate Collinearity
library(car)
vif(a) # variance inflation factors 
sqrt(vif(a)) > 2 # problem?

###################################################
#genetic algorithm
library("GA")

#The design matrix without the intercept is extracted from the fitted model object by:


x<- model.matrix(a)[,-1]
y<- model.response(model.frame(a))

#Then the function can be maximized by the following:

fitness <- function(string){
    #print(string)
    inc <- which(string ==1)
    x<- cbind(1,x[,inc])
    mod<-lm.fit(x,y)
    class(mod) <- "lm"
    -AIC(mod)
}

GA<-ga("binary",fitness= fitness,nBits=ncol(x),names=colnames(x),monitor=plot)
summary(GA)

######################################################

fat1<-fat[,-c(2,10)]
b<-lm(formula=body.fat.siri~.,data = fat1)
summary(b)
mse1 <- mean(residuals(b)^2)
rmse1 <- sqrt(mse1)

######################################################
#random forest
library(randomForest)
##Partition the dataset into training and testing
library(caret)
set.seed(500)   ### how many times u ran the code it makes the samples
inTrain1<-createDataPartition(fat$body.fat.siri,p=0.60,list=F)
dataTrain1<-fat[inTrain1,]
dataTest1<-fat[-inTrain1,]

##Model
rmf<-randomForest(body.fat.siri~.,data=fat)
rmfres<-data.frame(importance(rmf))
str(rmfres)

rmfres1<-rmfres[order(-rmfres$IncNodePurity), ,drop = FALSE]

rf <-randomForest(body.fat.siri~.,data=fat, importance=TRUE,ntree=500)
#Evaluate variable importance
imp = importance(rf, type=1)
#imp <- data.frame(predictors=rownames(imp),imp)



fat1<-fat[,-c(2,10)]
b<-lm(formula=body.fat.siri~.,data = fat1)
summary(b)
mse1 <- mean(residuals(b)^2)
rmse1 <- sqrt(mse1)


#####################################################




s<-lm(body.fat.siri~abdomen+age+neck+BMI,data = fat)
summary(s)



library(Rcmdr)
library(relimp, pos=25)
#showData(fat, placement='-20+200', font=getRcmdr('logFont'), maxwidth=80, maxheight=35)
RegModel.1 <-  lm(body.fat.siri~abdomen+age+ankle+BMI+chest+ffweight+height+hip+knee+neck+thigh+weight, data=fat)
summary(RegModel.1)
require(MASS)
library(MASS, pos=26)
stepwise(RegModel.1, direction='forward/backward', criterion='AIC')
stepwise(RegModel.1, direction='backward/forward', criterion='AIC')
stepwise(RegModel.1, direction='backward/forward', criterion='AIC')

###############################################################


pairs(fat)
###############################################################
#information gain
library(FSelector)
weights <- information.gain(body.fat.siri~., fat)

###############################################################
#regression subsets
library(leaps)
regsubsets.out <-
    regsubsets(body.fat.siri~.,
               data = fat,
               nbest = 1,       # 1 best model for each number of predictors
               nvmax = NULL,    # NULL for no limit on number of variables
               force.in = NULL, force.out = NULL,
               method = "exhaustive")
regsubsets.out

summary.out <- summary(regsubsets.out)
as.data.frame(summary.out$outmat)


## Adjusted R2
plot(regsubsets.out, scale = "adjr2", main = "Adjusted R^2")


##############################################################

hist(fat$body.fat.siri)
















# ensure the results are repeatable
set.seed(7)
# load the library
library(mlbench)
library(caret)
# calculate correlation matrix
correlationMatrix <- cor(fat[,1:13])
# summarize the correlation matrix
print(correlationMatrix)
# find attributes that are highly corrected (ideally >0.75)
highlyCorrelated <- findCorrelation(correlationMatrix, cutoff=0.5)
# print indexes of highly correlated attributes
print(highlyCorrelated)


# ensure results are repeatable
set.seed(7123489)
# load the library
library(mlbench)
library(caret)
# load the dataset
#data(PimaIndiansDiabetes)
# prepare training scheme
control <- trainControl(method="repeatedcv", number=10, repeats=3)
# train the model
model <- train(body.fat.siri ~. , data = fat, method="lvq", preProcess="scale", trControl=control)# estimate variable importance
importance <- varImp(model, scale=FALSE)# summarize importance
print(importance)
# plot importance
plot(importance)
fat$body.fat.siri<-as.factor(fat$body.fat.siri)
seeds <- lapply(seeds, as.vector)
