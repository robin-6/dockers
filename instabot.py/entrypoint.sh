#!/bin/sh

sed -i -r 's/(login *=).*/\1os.environ.get("INS_NAME")/g' example.py
sed -i -r 's/(password *=).*/\1os.environ.get("INS_PASSWD")/g' example.py

if [ "$PROXY" != "" ]; then 
  sed -i -r 's/(proxy *=).*/\1os.environ.get("PROXY")/g' example.py
fi

python example.py
