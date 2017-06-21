#!/bin/sh

sed -i 's/"username"/os.environ.get("INS_NAME")/g' example.py
sed -i 's/"password"/os.environ.get("INS_PASSWD")/g' example.py
sed -i 's/"proxy"/os.environ.get("PROXY")/g' example.py

python example.py
