#!/bin/bash

FILE="$1"
NAME="$2"

echo "Converting dot to SVG" >&2
dot -Tsvg <(xml sel -t -v "/sam[@type='dot' and @name='$NAME']" "$FILE")
