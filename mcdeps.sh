#!/bin/bash

FILE="$1"
NOPREFIX=${2:-0}
SECTIONLINES=""
DEPLINES=""

while read -r line;
do
	CUR="./$line"	
	SECTION="./sections/$line"	

	if [[ -f "$CUR" ]]; then
			LOCATION=$CUR		
		else
			LOCATION=$SECTION		
	fi
	DEPLINES="$DEPLINES ${LOCATION}.d"	
	SECTIONLINES="$SECTIONLINES ${LOCATION}"	
	echo "$LOCATION: ${FILE}.outputs"
done < <(xml unesc - < "$FILE" | xml sel -t -v '//sam[text() != ""]/@name')

while read -r line;
do
	echo "./merged/${FILE}: ./sections/$line"
done < <(xml unesc - < "$FILE" | xml sel -t -v '//sam[not(text())]/@name')

if [ $NOPREFIX == "1" ]; then
	echo $SECTIONLINES
	exit 0
fi

# echo "${FILE}:$DEPLINES"
if [[ $FILE == "ideatable" ]]; then
		echo "./merged/${FILE}: $SECTIONLINES"
	else
		echo "./merged/${FILE}: ./merged/header.md ./merged/fulltable.md"
		echo "./merged/${FILE}: idea.md ${FILE}.outputs $SECTIONLINES"
fi

echo "${FILE}.outputs: ${FILE}"
echo "	extractfile.sh ${FILE}"
echo "	touch ${FILE}.outputs"
