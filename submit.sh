#!/bin/bash

FILE="$1"
NAME="$2"
DEST="$3"
xml="application/xml"
TYPE=${4:-$xml}

curl --user admin:admin \
 	-i -H "Accept: application/xml" \
	-H "Content-Type: $TYPE" \
	-X PUT \
  --data "@$FILE" \
 	"http://localhost:8660/exist/rest/db/sam/$DEST/$NAME"
