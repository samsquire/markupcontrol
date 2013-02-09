#!/bin/bash

FILE="$1"
NAME="$2"
echo "processing xquery from $FILE" >&2

# Store the query in the database
submit.sh <(xml sel -t -v "/sam[@type='xquery' and @name='$NAME']" "$FILE" | xml unesc) "$NAME" "output" "application/xquery" >&2

# Run the query
runxquery.sh "output" "$NAME"
