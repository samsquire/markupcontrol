#!/bin/bash

FILE="$1"

VALID="//sam[(./ancestor::sam) and not(./sam)]"
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
		rm "$outfilename"
		xml sel -t -c "$DEEPNODE" "$FILE" > $outfilename
		if [[ -n "$TYPE" ]]; then
				./$TYPE.sh $outfilename $filename > ./output/$filename
				cat output/$filename
				# Write the output into the file
				xml ed -L --update "/sam[@name = '$filename']" --value "$(<output/$filename)"	"$outfilename"
		fi

		if [[ $DEPENDENTS -gt 0 ]]; then
			for j in $(seq 1 $DEPENDENTS);
			do
				INNERTYPE=$(xml sel -t -v "$DEPENDENTNODE[$j]/@type" "$FILE")
				innerfilename=$(xml sel -t -v "$DEPENDENTNODE[$j]/@name" "$FILE")
				inneroutputfilename="./output/$innerfilename"	
				xml sel -t -c "$DEPENDENTNODE[$j]" "$FILE" > $inneroutputfilename;
				echo "Dependent type is $INNERTYPE"
				echo "Written Dependent output $inneroutputfilename"
				# Use the last type
				# xml ed -L --insert "/sam[@name = '$filename']" --type attr --name "type" --value "$INNERTYPE"	"$outfilename"
				xml ed -L --update "/sam[@name = '$filename']/@type" --value "$INNERTYPE"	"$outfilename"
				xml ed -L --update "/sam[@name = '$filename']/@name" --value "$innerfilename"	"$outfilename"
				./$INNERTYPE.sh $outfilename $innerfilename > $inneroutputfilename

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
