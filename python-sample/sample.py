#!/usr/bin/env python3
#coding: utf-8
import os
import sys
import json
from requests_oauthlib import OAuth1Session

def die(message):
    print >> sys.stderr, "Error[gyo] :", message
    sys.exit(1)

def config_to_dictionary(file):
    d = {}
    arr = []
    for line in file:
        key, val = line.strip().split("=")
        d[key] = val
    return d

def tweet(twitterkeys, message):
    url = "https://api.twitter.com/1.1/statuses/update.json"
    twitter = OAuth1Session(
        twitterkeys["CONSUMER_KEY"],
        twitterkeys["CONSUMER_SECRET"],
        twitterkeys["ACCESS_TOKEN"],
        twitterkeys["ACCESS_TOKEN_SECRET"]
    )
    params = {"status": message}
    req = twitter.post(url, params = params)
    if req.status_code == 200:
        print("OK")
    else:
        die("Error: %d" % req.status_code)

def home_timeline(twitterkeys, count):
    url = "https://api.twitter.com/1.1/statuses/home_timeline.json"
    twitter = OAuth1Session(
        twitterkeys["CONSUMER_KEY"],
        twitterkeys["CONSUMER_SECRET"],
        twitterkeys["ACCESS_TOKEN"],
        twitterkeys["ACCESS_TOKEN_SECRET"]
    )
    params = {'count': count}
    req = twitter.get(url, params = params)
    if req.status_code == 200:
        timeline = json.loads(req.text)
        for tweet in timeline:
            print(tweet["text"])
    else:
        print ("Error: %d" % req.status_code)

if __name__ == '__main__':
    config = os.getenv("HOME") + os.sep + "twitter.key"
    twitterkeys = None
    if os.path.isfile(config):
        try:
            file = open(config,'r')
            twitterkeys = config_to_dictionary(file)
            file.close()
        except IOError:
            die(config + ":file cannot open.")
    else:
        die(config + ":file not exists.")
    home_timeline(twitterkeys, 5)
