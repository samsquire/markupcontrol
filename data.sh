#!/bin/bash
FILE="$1"
NAME="$2"
TEXT=$(xml sel -t -v "/sam[@type='data' and @name='$NAME']" "$FILE" | xml unesc)

OUTPUT=$(xml sel -t -v "/sam[@type='data' and @name='$NAME']/@to" "$FILE" | xml unesc)

if [[ -z "$OUTPUT" ]]; then
	OUTPUT="text"
fi
echo "SPATQL output is $OUTPUT" >&2

if [[ "$OUTPUT" == "xml" ]]; then
	/Applications/jena-fuseki-0.2.5\ 2/s-query --output "$OUTPUT" --service "http://localhost:3030/tdb/sparql" "$TEXT" | xml fo -o
	else
	/Applications/jena-fuseki-0.2.5\ 2/s-query --output "$OUTPUT" --service "http://localhost:3030/tdb/sparql" "$TEXT"
fi

