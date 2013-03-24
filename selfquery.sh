#!/bin/bash

FILE="$1"
NAME="$2"
PARENT="$3"
CODE=$(xml sel -t -v "//sam[@type='selfquery' and @name='$NAME']/@code" "$FILE")

echo "In file $FILE section $NAME Inserting parent $PARENT..." >&2
submit.sh "$PARENT" "$PARENT" "graphs" "text/xml" >&2
echo "Inserting $CODE..." >&2
cat "$CODE" >&2
GID=$(expr "$PARENT" : '\(.*\)\.')
submit.sh <(gsed -e "s@NAME@$PARENT@g" -e "s@GID@$GID@g" "$CODE") "$CODE" "graphs" "application/xquery" >&2
runxquery.sh "graphs" "$CODE" | xml unesc
