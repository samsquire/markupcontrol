#!/bin/bash

FILE="$1"
NAME="$2"
echo "N3 processor $FILE with name $NAME" >&2
FROM=$(xml sel -t -v "/sam[@type='n3' and @name='$NAME']/@from" "$FILE")
TO=$(xml sel -t -v "/sam[@type='n3' and @name='$NAME']/@to" "$FILE")

if [[ -z "$FROM" ]]; then
 	FROM="n3"
fi
if [[ -z "$TO" ]]; then
 	TO="rdfa"
fi

SERVER="http://localhost:8080/convert/$FROM/$TO/content"
echo "Converting from $FROM to $TO with server $SERVER" >&2

# Find the element
# Select the data, decode it and send it to our N3->RDFA server
xml sel -t -v "/sam[@type='n3' and @name='$NAME']" "$FILE" | recode html..utf8 | curl --form content=@- \
"$SERVER"
