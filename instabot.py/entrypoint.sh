#!/bin/sh

sed -i -r 's/(login *=).*/\1os.environ.get("INS_NAME"),/g' example.py
sed -i -r 's/(password *=).*/\1os.environ.get("INS_PASSWD"),/g' example.py
sed -i -r 's/(tag_list *=).*/\1eval("[" + os.environ.get("TAGS") + "]"),/g' example.py
sed -i -r 's/(like_per_day *=).*/\1int(os.environ.get("LIKE_PER_DAY")),/g' example.py
sed -i -r 's/(comments_per_day *=).*/\1int(os.environ.get("COMMENTS_PER_DAY")),/g' example.py
sed -i -r 's/(follow_per_day *=).*/\1int(os.environ.get("FOLLOW_PER_DAY")),/g' example.py
sed -i -r 's/(unfollow_per_day *=).*/\1int(os.environ.get("UNFOLLOW_PER_DAY")),/g' example.py
sed -i -r 's/(log_mod *=).*/\1int(os.environ.get("LOG_MODE")),/g' example.py

if [ "$PROXY" != "" ]; then 
  sed -i -r 's/(proxy *=).*/\1os.environ.get("PROXY"),/g' example.py
fi

python example.py

