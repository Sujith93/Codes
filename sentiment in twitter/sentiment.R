#install.packages("tm.lexicon.GeneralInquirer", repos="http://datacube.wu.ac.at", type="source")
library(tm.lexicon.GeneralInquirer)
#install.packages("tm.plugin.sentiment", repos="http://R-Forge.R-project.org")
#library(tm.plugin.sentiment)
library(tm)
library(dplyr)

sentiment_analysis<-function(some_txt){
  corpus<-Corpus(VectorSource(some_txt))
  pos<-sum(sapply(corpus,tm_term_score,terms_in_General_Inquirer_categories("Positiv")))
  neg<-sum(sapply(corpus,tm_term_score,terms_in_General_Inquirer_categories("Negativ")))
  pos.score<-tm_term_score(TermDocumentMatrix(corpus,control=list(removePunctuation=TRUE)),terms_in_General_Inquirer_categories("Positiv"))
  neg.score<-tm_term_score(TermDocumentMatrix(corpus,control=list(removePunctuation=TRUE)),terms_in_General_Inquirer_categories("Negativ"))
  total.df<-data.frame(positive=pos.score,negative=neg.score)
  total.df<-transform(total.df,net=positive-negative)
  total.df
}
# sentiment_analysis(pepsi1$text)
# d$positive=as.factor(d$positive)
# d$negative=as.factor(d$negative)
# d$net=as.factor(d$net)
# d$positive=as.numeric(d$positive)
# d$negative=as.numeric(d$negative)
# d$net=as.numeric(d$net)
# hist(d$positive)
# clv <- group_by(clvbdp, CustomerId)
# clv1 <- summarise(clv,Frequency = n(),Monetary= round(sum(Payment)/Frequency),Payment_Agg=sum(Payment))
# d_pepsi<- d %>% group_by(Net_Score) %>% summarise(Frequency = n())


d<-sentiment_analysis(pepsi1$text)
pepsL<-subset(pepsi1,location == "Newyork,USA")
pepsL$text

d<-sentiment_analysis(pepsL$text)
d$Net_Score=ifelse(d$net != 0,ifelse(d$net>0,"Positive","Negative"),"Neutral")
d$Net_Score=as.factor(d$Net_Score)
bar_net_pepsi=table(d$Net_Score)
bp<-barplot(bar_net_pepsi,main="Sentiment Distribution for Pepsi Brand for Newyork,USA",xlab="Sentiment",ylim = c(0,250),
                        legend.text=TRUE,col = c("Red","Grey","Green"),ylab="Count",
                          args.legend = list(title = "Sentiment", x = "topright", cex = 0.65))
text(bp, 0, round(as.numeric(bar_net_pepsi[1:3])),cex=1,pos=3) 


coc<-subset(coca2,location == "Newyork,USA")
d1<-sentiment_analysis(coca2$text)
d1$Net_Score=ifelse(d1$net != 0,ifelse(d1$net>0,"Positive","Negative"),"Neutral")
d1$Net_Score=as.factor(d1$Net_Score)
bar_net_coca=table(d1$Net_Score)
bp1<-barplot(bar_net_coca,main="Sentiment Distribution for Coca Cola Brand",xlab="Sentiment",ylim = c(0,250),
                    legend.text=TRUE,col = c("Red","Grey","Green"),ylab="Count",
             args.legend = list(title = "Sentiment", x = "topright", cex = 0.65))
text(bp1, 0, round(as.numeric(bar_net_coca[1:3])),cex=1,pos=3)


