FROM python:2.7.12-alpine

RUN apk add --update --no-cache alpine-sdk bash git

WORKDIR /usr/src/app

ARG timezone=Etc/GMT-8
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ENV LD_LIBRARY_PATH /usr/src/app
ENV INS_NAME=''
ENV INS_PASSWD=''
ENV PROXY=''
ENV LIKE_PER_DAY=888
ENV COMMENTS_PER_DAY=100
ENV FOLLOW_PER_DAY=500
ENV UNFOLLOW_PER_DAY=200
ENV LOG_MODE=0
ENV TAGS=''

# Clone our private GitHub Repository
ADD https://raw.githubusercontent.com/uuaing/instabot.py/master/requirements.txt .
RUN git clone https://github.com/uuaing/instabot.py.git

RUN pip install --no-cache-dir --requirement requirements.txt

#remove unused stuff
RUN apk del alpine-sdk\
  && rm -rf /var/cache/apk/*

WORKDIR /usr/src/app/instabot.py
  
COPY entrypoint.sh /bin/entrypoint.sh
RUN chmod +x /bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
