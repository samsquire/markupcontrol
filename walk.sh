#!/bin/bash

FILE="$1"

VALID="(//sam[(./ancestor::sam) and not(./sam)])"
DEEPEST=$(xml sel -t -v "count($VALID)" "$FILE")

echo "There are $DEEPEST nodes"

if [[ $DEEPEST > 0 ]]; then
	for i in $(seq 1 $DEEPEST); 
	do
		DEEPNODE="$VALID[$i]"
		DEPENDENTNODE="$DEEPNODE/ancestor::sam"
		DEPENDENTS=$(xml sel -t -v "count($DEPENDENTNODE)" "$FILE")
		echo "There are $DEPENDENTS above this node";
		filename=$(xml sel -t -v "$DEEPNODE/@name" "$FILE")
		TYPE=$(xml sel -t -v "$DEEPNODE/@type" "$FILE")
		outfilename="./sections/$filename"
		echo "This node is $filename"
		echo "This Type is: $TYPE"
		echo "Output file: $outfilename"
		TEXT=$(xml sel -t -c "$DEEPNODE" "$FILE")
		LEN=$(echo $TEXT | awk "{print length}")
		if [[ $LEN -eq 0 ]]; then
			rm "$outfilename"
			echo $TEXT > $outfilename
			else
				echo "Inclusion node."
		fi
		if [[ -n "$TYPE" ]]; then
				$TYPE.sh "$outfilename" "$filename" > "./output/$filename"
				# ./submit.sh ./output/$filename $filename "output"	
				echo "Output was:"
				cat "output/$filename"
				# Write the output into the file
				# xml ed -O -L --update "/sam[@name = '$filename']" --value "$(<output/$filename)"	"$outfilename"
				echo "INSIDE $FILE IS $DEEPNODE $outfilename $filename I have $DEPENDENTS dependents"	
					
				# xml sel -t -v "$DEEPNODE" "$FILE"
				
				xml ed -P -O -L --update "//sam[@name = '$filename']" --value "$(<./output/$filename)" "$outfilename"
		fi

			if [[ $DEPENDENTS -gt 0 ]]; then
				for j in $(seq 1 $DEPENDENTS);
				do
					INNERTYPE=$(xml sel -t -v "$DEPENDENTNODE[$j]/@type" "$FILE")
					innerfilename=$(xml sel -t -v "$DEPENDENTNODE[$j]/@name" "$FILE")
					inneroutputfilename="./sections/$innerfilename"	
					xml sel -t -c "$DEPENDENTNODE[$j]" "$FILE" > $inneroutputfilename;
					echo "Dependent type is $INNERTYPE $DEPENDENTNODE[$j]/@type"
					echo "Written Dependent output $inneroutputfilename"
					# Use the last type
					# xml ed -L --insert "/sam[@name = '$filename']" --type attr --name "type" --value "$INNERTYPE"	"$outfilename"
					if [[ -n "$INNERTYPE" ]]; then
						xml ed -P -O -L --update "//sam[@name = '$filename']/@type" --value "$INNERTYPE"	"$outfilename"
					fi
					# xml ed -L --update "/sam[@name = '$filename']/@name" --value "$innerfilename"	"$outfilename"

					# Update text (to preserve mixed text and nodes)
					if [[ -f "./output/$filename" ]];	then
						TEXT=$(<./output/$filename)
						else
							if [[ -f "./sections/$filename" ]]; then
								echo "Including non-typed input"
								# Include a non-typed block
								TEXT=$(xml sel -t -v "//sam[@name = '$filename']" "./sections/$filename" | xml unesc)				
								echo $TEXT
							fi	
						fi
						echo "Output text is $TEXT"
						echo "Writing into parent: $TEXT $inneroutputfilename"
						xml ed -P -O -L --insert "//sam[@name = '$filename']" --type text --name ignored --value "$TEXT" "$inneroutputfilename"
						# Delete the old node
						xml ed -P -O -L --delete "//sam[@name = '$filename']" "$inneroutputfilename"

					if [[ -n "$INNERTYPE" ]]; then
						$INNERTYPE.sh "$inneroutputfilename" "$innerfilename" > "./output/$innerfilename"
					fi
					echo "Updating file contents"
					# xml ed -L --update "//sam[@name = '$filename']" --value "$(<./output/$innerfilename)"	"$inneroutputfilename"
					outfilename="$inneroutputfilename"
					filename="$innerfilename"	
					# xml sel --noblanks -t -v "$DEPENDENTNODE[$j]/text()" "$FILE"	

				done
			fi

		# Still in a sam node	
	done

	else
		echo "No nested blocks."
fi
