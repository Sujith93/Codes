#https://mkmanu.wordpress.com/2014/08/05/sentiment-analysis-on-twitter-data-text-analytics-tutorial/

# Load the necessary packages
library(twitteR)
library(wordcloud)
library(RColorBrewer)
library(plyr)
library(ggplot2)
library(sentimentr)
library(httr)
oauth_endpoints("twitter")
api_key <-'PqNhaShuF97DQliRpp7xf6xeT'
api_secret <- 'DQ69l0yR6cbcZ4B41xFfZL1LdhkdWdGdh8GOSh9cdnBw0zSTeb'
access_token <- '4862859732-zpmDAWbRLidnZP4a8o1e4udMdgQylOH7fZFoYMu'
access_token_secret <- 'DTo7clVWcEc9mN7ZRErKBI0V1n3hs6L177oqLoShBKaJ5'
setup_twitter_oauth(api_key,api_secret,access_token,access_token_secret)
Sindhu_tweets = searchTwitter('P.V.Sindhu', n=200, lang='en')
# fetch the text of these tweets
sindhu_txt = sapply(Sindhu_tweets, function(x) x$getText())
# Now we will prepare the above text for sentiment analysis
# First we will remove retweet entities from the stored tweets (text)
sindhu_txt = gsub("(RT|via)((?:\\b\\W*@\\w+)+)", "", sindhu_txt)
# Then remove all "@people"
sindhu_txt = gsub("@\\w+","", sindhu_txt)
# Then remove all the punctuation
sindhu_txt = gsub("[[:punct:]]", "", sindhu_txt)
# Then remove numbers, we need only text for analytics
sindhu_txt = gsub("[[:digit:]]","", sindhu_txt)
# the remove html links, which are not required for sentiment analysis
sindhu_txt = gsub("http\\w+","", sindhu_txt)
# finally, we remove unnecessary spaces (white spaces, tabs etc)
sindhu_txt = gsub("[ \t]{2,}","", sindhu_txt)
sindhu_txt = gsub("^\\s+|\\s+$","", sindhu_txt)
catch.error = function(x){
    # let us create a missing value for test purpose
    y = NA
    # try to catch that error (NA) we just created
    catch_error = tryCatch(tolower(x), error=function(e) e)
    # if not an error
    if (!inherits(catch_error, "error"))
        y = tolower(x)
    # check result if error exists, otherwise the function works fine.
    return(y)
}
# Now we will transform all the words in lower case using catch.error function we just created above and with sapply function
sindhu_txt = sapply(sindhu_txt, catch.error)
# Also we will remove NAs, if any exists, from bjp_txt (the collected and refined text in analysis)
sindhu_txt = sindhu_txt[!is.na(sindhu_txt)]
# also remove names (column headings) from the text, as we do not want them in the sentiment analysis
names(sindhu_txt) = NULL
library(Rstem)
library(sentiment)
#http://cran.r-project.org/web/packages/sentiment/index.html
sindhu_class_emo = classify_emotion(sindhu_txt, algorithm="bayes", prior=1.0)
emotion = sindhu_class_emo[,7]
emotion[is.na(emotion)] = "unknown"
#Ploarity
sindhu_class_pol = classify_polarity(sindhu_txt, algorithm="bayes")
polarity = sindhu_class_pol[,4]
sentiment_dataframe = data.frame(text=sindhu_txt, emotion=emotion, polarity=polarity, stringsAsFactors=FALSE)
sentiment_dataframe = within(sentiment_dataframe, emotion <- factor(emotion, levels=names(sort(table(emotion), decreasing=TRUE))))
##emotions plot
ggplot(sentiment_dataframe, aes(x=emotion)) + geom_bar(aes(y=..count.., fill=emotion)) +
    scale_fill_brewer(palette="Dark2") +
    ggtitle('Sentiment Analysis of Tweets on Twitter about P.V.Sindhu') +
    theme(legend.position='right') + ylab('Number of Tweets') + xlab('Emotion Categories')
##Polarity Plot
ggplot(sentiment_dataframe, aes(x=polarity)) +
    geom_bar(aes(y=..count.., fill=polarity)) +
    scale_fill_brewer(palette='RdGy') +
    ggtitle('Sentiment Analysis of Tweets on Twitter about P.V.Sindhu') +
    theme(legend.position='right') + ylab('Number of Tweets') + xlab('Polarity Categories')
##wordcloud
sindhu_emos = levels(factor(sentiment_dataframe$emotion))
n_sindhu_emos = length(sindhu_emos)
sindhu.emo.docs = rep("", n_sindhu_emos)
for (i in 1:n_sindhu_emos)
{
    tmp = sindhu_txt[emotion == sindhu_emos[i]]
    sindhu.emo.docs[i] = paste(tmp, collapse=" ")
}

sindhu.emo.docs = removeWords(sindhu.emo.docs, stopwords("english"))
sindhu.corpus = Corpus(VectorSource(sindhu.emo.docs))
sindhu.tdm = TermDocumentMatrix(sindhu.corpus)
sindhu.tdm = as.matrix(sindhu.tdm)
colnames(sindhu.tdm) = sindhu_emos
comparison.cloud(sindhu.tdm, colors = brewer.pal(n_sindhu_emos, 'Dark2'),
                 scale = c(3,.5), random.order = FALSE, title.size = 1.5)


