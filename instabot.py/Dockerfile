FROM python:2.7.12-alpine

WORKDIR /usr/src/app

RUN apk update \
    && apk upgrade \
    && apk add ca-certificates \
    && update-ca-certificates \
    && apk add --update tzdata \
    && apk add --update --no-cache alpine-sdk bash git
    
ENV TZ=Asia/Shanghai

ADD https://raw.githubusercontent.com/uuaing/instabot.py/master/requirements.txt .

RUN pip install --no-cache-dir --requirement requirements.txt

#remove unused stuff
RUN apk del alpine-sdk\
  && rm -rf /var/cache/apk/*
  
CMD ["python", "/usr/src/app/instabot.pyexample.py"]