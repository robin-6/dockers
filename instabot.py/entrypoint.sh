#!/bin/sh

sed -ir "s/(username *= *').*/\1os.environ.get("INS_NAME")'/g" example.py
sed -ir "s/(password *= *').*/\1os.environ.get("INS_PASSWD")'/g" example.py

if [ "$PROXY" != "" ]; then 
  sed -ir "s/(proxy *= *').*/\1os.environ.get("PROXY")'/g" example.py
fi

python example.py
