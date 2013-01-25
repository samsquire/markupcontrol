#!/bin/bash

FILE="$1"
printf "${FILE}.d: "

while read -r line;
do
	CUR="./$line"	
	SECTION="./sections/$line"	

	if [[ -f "$CUR" ]]; then
			LOCATION=$CUR		
		else
			LOCATION=$SECTION		
	fi
	printf "${LOCATION}.d "	
done < <(xml unesc - < "$FILE" | xml sel -t -v "//sam//@name")
