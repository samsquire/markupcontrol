#!/bin/bash
FILE="$1"
NAME="$2"
TEXT=$(xml sel -t -v "/sam[@type='data' and @name='$NAME']" "$FILE" | xml unesc)

/Applications/jena-fuseki-0.2.5\ 2/s-query --output text --service http://localhost:3030/tdb/sparql "$TEXT"
