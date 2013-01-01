#!/bin/bash
FILE="$1"
NAME="$2"
echo  "now processing $NAME from $FILE" >&2
rm "./rules/$NAME"
xml sel -t -v "/sam[@type='rule' and @name='$NAME']" "$FILE" | xml unesc > "./rules/$NAME"
