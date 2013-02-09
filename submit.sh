#!/bin/bash

FILE="$1"
NAME="$2"
DEST="$3"
xml="application/xml"
TYPE=${4:-$xml}
SERVER=${5:-localhost:8660}

curl --user admin:admin \
 	-i -H "Accept: application/xml" \
	-H "Content-Type: $TYPE" \
	-X PUT \
  -T "$FILE" \
 	"http://$SERVER/exist/rest/db/sam/$DEST/$NAME"
