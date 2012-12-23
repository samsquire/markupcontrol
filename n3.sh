#!/bin/bash

FILE="$1"
NAME="$2"
echo "N3 processor $FILE with name $NAME" >&2

# Find the element
# Select the data, decode it and send it to our N3->RDFA server
xml sel -t -v "/sam[@type='n3' and @name='$NAME']" "$FILE" | recode html..utf8 | curl --form content=@- "http://localhost:8080/convert/n3/rdfa/content"
