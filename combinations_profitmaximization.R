
unique(Shelf1$Items)

for(i in 1:levels(Shelf1$Items)) 
  
Items_levels =  levels(Shelf1$Items)

sujith  = list(1:19)

length(sujith[[1]])


combn(1:19,12)

murali = Shelf1

murali$Items=as.numeric(murali$Items)
View(m)

v=m[1,]
#b = list()
m = m[,-13]
m$profitmax = rep(0,times = nrow(m))
for(i in 1:nrow(m)){
  c = 0
  tem = m[i,]
  for(j in 1:nrow(murali)){
    for(n in 1:length(tem)){
      if(murali$Items[j]==tem[n]){
        a=murali$profit[j]
        c = sum(c,a)
      }
    }
  }
  m$profitmax[i] = c
}

write.csv(m,'C:/MY_Work/Recomendations_Tata/profit.csv')

