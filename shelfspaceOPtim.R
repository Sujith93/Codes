#########shelf1#########

#importing packages
library(genalg)
library(ggplot2)
#importing dataset for shef1
Shelf1 <- read.csv("C:/Users/sujith.kumar/Desktop/Shelf1.csv")

#creating chromosome
chromosome = c(1,0,0,1, 1,0,0,1,1,0,1,0,1,0,1,1,1,0,1)
length(chromosome)
Shelf1[chromosome == 1, ]
#condition
weightlimit  <- 1000
#evaluation function
evalFunc <- function(x) {
    current_solution_survivalpoints <- x %*% Shelf1$profit
    current_solution_weight <- x %*% Shelf1$Weight
    
    if (current_solution_weight > weightlimit) 
        return(0) else return(-current_solution_survivalpoints)
}
#no nof iterations
iter = 200
#Model building
GAmodel <- rbga.bin(size = 19, popSize = 300, iters = iter, mutationChance = 0.01, 
                    elitism = T, evalFunc = evalFunc)
#result
summary(GAmodel, echo=TRUE)




########shelf2#################


#importing packages
library(genalg)
library(ggplot2)
#importing dataset for shef1
Shelf2 <- read.csv("C:/Users/sujith.kumar/Desktop/Shelf2.csv")
Shelf2$weight <- as.matrix(Shelf2$weight)
#creating chromosome
chromosom = c(1,0,0,1, 1,0,0,1,1,0,1,0,1,0,1,1,1,0,1)
length(chromosom)
Shelf2[chromosom == 1, ]
#condition
weightlimit  <- 1000
#evaluation function
evalFunc <- function(x) {
    current_solution_survivalpoints <- x %*% Shelf2$profit
    current_solution_weight <- x %*% Shelf2$weight
    
    if (current_solution_weight > weightlimit) 
        return(0) else return(-current_solution_survivalpoints)
}
#no nof iterations
iter1 = 200
#Model building
GAmodel1 <- rbga.bin(size = 19, popSize = 300, iters = iter1, mutationChance = 0.01, 
                    elitism = T, evalFunc = evalFunc)
#result
summary(GAmodel1, echo=TRUE)



################################

Shelf2<-Shelf2[,-3]
#Shelf1$weight<- runif(19, min = 10, max= 100)
Shelf2$weight<- sample(1:100,19,replace =TRUE)
Shelf1$weight<-round(Shelf1$weight)
sum(Shelf2$weight)
GAmodel
