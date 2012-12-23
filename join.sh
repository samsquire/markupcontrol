#!/bin/bash
FILE="$1"

if [[ -e $FILE ]]; then
	cp $FILE ./merged/
	FILE="./merged/$FILE"
	echo "Using copied $FILE"
	# Replace each file with output
	while read -r line;
	do
		INPUT=$line
		TYPE=$(xml sel -t -v "/sam[@name = '$INPUT']/@type" "./sections/$INPUT") 	
		if [[ -z "$TYPE" ]]; then
				echo "Untyped text $INPUT"
				TEXT=$(xml sel -t -v "/document/sam[@name = '$INPUT']" "$FILE" | xml unesc)
			else
				echo "Typed text $INPUT"	
				TEXT=$(<./output/$INPUT)
		fi
		xml ed -L --insert "/document/sam[@name = '$INPUT']" --type text --name ignored --value "$TEXT" "$FILE"
		# Delete the old node
		xml ed -L --delete "/document/sam[@name = '$INPUT']" "$FILE"

	done < <(xml sel -t -v '/document/sam/@name' "$FILE")
	xml sel -t -v '/document' $FILE > $FILE.tmp
	xml unesc - < $FILE.tmp > $FILE
	rm $FILE.tmp
	else
		echo "No file exists"

fi
