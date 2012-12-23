#!/bin/bash
FILE="$1"
NAME="$2"
if [[ -e "$FILE" ]]; then
	echo "SPARQL processing. Found file" >&2;
fi
/Applications/jena-fuseki-0.2.5\ 2/s-update --service http://localhost:3030/tdb/update --update=<(xml sel -t -v "/sam[@type='sparql' and @name='$NAME']" "$FILE" | xml unesc)
