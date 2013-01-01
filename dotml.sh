#!/bin/bash

FILE="$1"
NAME="$2"

echo "Converting dotml to SVG" >&2
GRAPHNAME=$(xml sel -t -v "/sam[@type='dotml' and @name='$NAME']/@graphname" "$FILE")
rm ./graph/$GRAPHNAME.dot


$DOTML_DIR/generate-svg-graphics.bash <(xml sel -t -v "/sam[@type='dotml' and @name='$NAME']" "$FILE" | xml unesc) ./graph >&2


# Output the SVG
xml fo --omit-decl ./graph/$GRAPHNAME.svg | xml c14n
# cat ./graph/$GRAPHNAME.svg
