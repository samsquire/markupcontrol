#!/bin/bash

FILE="$1"
NAME="$2"
SOURCE=$(xml sel -t -v "//sam[@type='subs' and @name='$NAME']/@source" "$FILE")
TEMPLATE=$(xml sel -t -v "//sam[@type='subs' and @name='$NAME']/@template" "$FILE")

echo "the file is $FILE, source is: $SOURCE, template is $TEMPLATE: " >&2
# xml sel -B -t -c "/document" "$SOURCE" > "./output/source.subs"
./submit.sh "$SOURCE" "sources.subs" "sources" "text/xml" >&2
# xml sel -B -t -c "/sam[@type='subs' and @name='$NAME']/node()" "$FILE" > ./output/replacements.subs
./submit.sh "$FILE" "replacements.subs" "sources" "text/xml" >&2

./submit.sh "$TEMPLATE" "$TEMPLATE" "sources" "application/xquery" >&2

SUBNAME=$NAME.sub
./runxquery.sh "sources" "$TEMPLATE" | xml unesc > ./output/$SUBNAME
./extractfile.sh "./output/$SUBNAME" >&2
./walk.sh "./output/$SUBNAME" >&2
./join.sh "./output/$SUBNAME" >&2

cat "./merged/$SUBNAME"
