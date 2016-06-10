#PCA on caret package 
require(caret)
data(cars)
trans = preProcess(cars,method=c("BoxCox", "center","scale", "pca"))
PC = predict(trans,cars)
trans$rotation

