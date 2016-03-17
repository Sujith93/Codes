from tweepy import Stream
from tweepy import OAuthHandler
from tweepy.streaming import StreamListener
import time

ckey = "PqNhaShuF97DQliRpp7xf6xeT"
csecret = "DQ69l0yR6cbcZ4B41xFfZL1LdhkdWdGdh8GOSh9cdnBw0zSTeb"
atoken = "4862859732-zpmDAWbRLidnZP4a8o1e4udMdgQylOH7fZFoYMu"
asecret = "DTo7clVWcEc9mN7ZRErKBI0V1n3hs6L177oqLoShBKaJ5"

class listener(StreamListener):

    def on_data(self, data):
        try:
            print data
            saveFile = open('twitDB.csv','a')
            saveFile.write(data)
            saveFile.write('\n')
            saveFile.close()
            return True
        except BaseException, e:
             print 'failed on data,',Str(e)
             time.sleep(5)
    
    def on_error(self, status):
        print status


auth = OAuthHandler(ckey, csecret)
auth.set_access_token(atoken,asecret)
twitterStream = Stream(auth,listener())
twitterStream.filter(track=["flipkart"])
