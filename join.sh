#!/bin/bash
FILE="$1"
MERGING="$2"

if [[ -e $FILE ]]; then
	cp $FILE ./merged/
	FILE="./merged/$(basename $FILE)"
	echo "Using copied $FILE"
	# Replace each file with output
	while read -r line;
	do
		INPUT=$line
		OK=1
		# TYPE=$(xml sel -t -v "//sam[@name = '$INPUT']/@type" "./sections/$INPUT") 	
		TYPE=$(xml sel -t -v "//sam[@name = '$INPUT']/@type" "$FILE") 	
		if [[ -z "$TYPE" ]]; then
				NESTED=$(xml sel -t -v "count(//sam[@name = '$INPUT']/child::sam)" "./sections/$INPUT")	
				FILENESTED=$(xml sel -t -v "count(//sam[@name = '$INPUT']/child::sam)" "$FILE")	
				echo "$INPUT: Input Untyped has $NESTED nested"
				echo "$INPUT: Source file has $FILENESTED nested"
				if [[ "$NESTED" -gt 0 ]]; then
						OK=0
					else
						echo "$INPUT: Not nested"
						# TEXT=$(xml sel -t -v "/document//sam[@name = '$INPUT']" "$FILE" | xml unesc)
						TEXT=$(xml sel -t -v "/sam[@name = '$INPUT']" "./sections/$INPUT" | xml unesc)
				fi
				
				if [[ $FILENESTED -eq 0 && $NESTED -eq 0 ]]; then
					echo "No nested - completeley plain. $INPUT"
					ok=1
					TEXT=$(xml sel -t -v "//sam[@name = '$INPUT']" "./sections/$INPUT" | xml unesc)
					echo "$TEXT"
					else
						# The source file has no nested elements, only the section does.
						if [[ "$FILENESTED" = 0 ]]; then
							if [[ -z "$MERGING" ]]; then
								OK=1
								./join.sh "./sections/$INPUT" "merging"
								echo "Source file has no nested children. Must be completely sourced."
								TEXT=$(<./merged/$INPUT)
							fi
						fi
				fi


				echo "DONE Untyped text $INPUT"
				echo
			else
				echo "Typed text $INPUT"	
				TEXT=$(<./output/$INPUT)
		fi
	
		if [[ "$OK" == 1 ]]; then
			xml ed -L --insert "//sam[@name = '$INPUT']" --type text --name ignored --value "$TEXT" "$FILE"
			# Delete the old node
			xml ed -L --delete "//sam[@name = '$INPUT']" "$FILE"
		fi

	done < <(xml sel -t -v '//sam/@name' "$FILE")
	xml sel -t -v '/' $FILE > $FILE.tmp
	xml unesc - < $FILE.tmp > $FILE
	rm $FILE.tmp
	else
		echo "No file exists"

fi
