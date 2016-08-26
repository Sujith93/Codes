from tweepy import Stream
from tweepy import OAuthHandler
from tweepy.streaming import StreamListener
import time
import re
import string
ckey = "PqNhaShuF97DQliRpp7xf6xeT"
csecret = "DQ69l0yR6cbcZ4B41xFfZL1LdhkdWdGdh8GOSh9cdnBw0zSTeb"
atoken = "4862859732-zpmDAWbRLidnZP4a8o1e4udMdgQylOH7fZFoYMu"
asecret = "DTo7clVWcEc9mN7ZRErKBI0V1n3hs6L177oqLoShBKaJ5"
class listener(StreamListener):
    def on_data(self, data):
        try:
            #print data
            Created = data.split('"created_at":"')[1].split('","id":')[0]
            ID = data.split(',"id":')[1].split(',"id_str":')[0]
            id_str = data.split(',"id_str":"')[1].split('","text":')[0]
            text = data.split(',"text":"')[1].split('","source":')[0]
            source = data.split(',"source":')[1].split(',"user":{"id":')[0]
            user_id = data.split('"user":{"id":')[1].split(',"id_str":"')[0]
            id_str = data.split('"id_str":"')[1].split('","name":"')[0]
            Name = data.split('","name":"')[1].split('","screen_name":"')[0]
            Screen_Name = data.split(',"screen_name":"')[1].split('","location":')[0]
            location = data.split('","location":"')[1].split('","url":"')[0]
            followers_count =data.split('"followers_count":')[1].split(',"friends_count":')[0]
            #friends_count = data.split('"friends_count":')[1].split(',"listed_count')[0]
            #time_zone = data.split('"time_zone":"')[1].split('","geo_enabled"')
            saveThis = Created+','+ID+','+id_str+','+text+','+source+','+user_id+','+id_str+','+Name+','+Screen_Name+','+location+','+followers_count
            #+','+friends_count+','+time_zone
            print saveThis
            saveFile = open('twit.csv','a')
            saveFile.write(saveThis)
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
twitterStream.filter(track=["Pepsi"])
