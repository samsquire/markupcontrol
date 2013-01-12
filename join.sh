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
		OK=1
		TYPE=$(xml sel -t -v "//sam[@name = '$INPUT']/@type" "./sections/$INPUT") 	
		if [[ -z "$TYPE" ]]; then
				NESTED=$(xml sel -t -v "count(//sam[@name = '$INPUT']/child::sam)" "./sections/$INPUT")	
				if [[ "$NESTED" -gt 0 ]]; then
				echo "Untyped has $NESTED nested"
						echo "Untyped has $NESTED nested"
						OK=0
					else
						echo "Not nested"
						# TEXT=$(xml sel -t -v "/document//sam[@name = '$INPUT']" "$FILE" | xml unesc)
						TEXT=$(xml sel -t -v "/sam[@name = '$INPUT']" "./sections/$INPUT" | xml unesc)
				fi	
				echo "Untyped text $INPUT"
			else
				echo "Typed text $INPUT"	
				TEXT=$(<./output/$INPUT)
		fi
	
		if [[ "$OK" == 1 ]]; then
			xml ed -L --insert "/document//sam[@name = '$INPUT']" --type text --name ignored --value "$TEXT" "$FILE"
			# Delete the old node
			xml ed -L --delete "/document//sam[@name = '$INPUT']" "$FILE"
		fi

	done < <(xml sel -t -v '/document//sam/@name' "$FILE")
	xml sel -t -v '/document' $FILE > $FILE.tmp
	xml unesc - < $FILE.tmp > $FILE
	rm $FILE.tmp
	else
		echo "No file exists"

fi
