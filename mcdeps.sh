#!/bin/bash

FILE="$1"
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
done < <(xml unesc - < "$FILE" | xml sel -t -v "//sam//@name")

# echo "${FILE}:$DEPLINES"
echo "${FILE}: $SECTIONLINES"
