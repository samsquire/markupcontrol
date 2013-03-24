#!/bin/bash
PREFIX="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
VALID=0
FILE="$1"
NODELETE="--nodelete"
DELETE=${1:-$nodelete}
validation=$(xml val $FILE)
markuped=$(xml sel -t -c 'count(//sam)' $FILE)	
if [[ "$validation" == *"invalid"*  ]]; then
	if [[ "$markuped" -gt 0 ]]; then
		echo "Unrecognised file contains markup - wrapping in markup."
		gsed -i '1i\<document>\' "$FILE"
		gsed -i '$a\<\/document>' "$FILE"
		VALID=1
	fi
else 
	markuped=$(xml sel -t -c 'count(/document)' $FILE)	
	if [[ $markuped -eq 1 ]]; then
		echo "File already wrapped."
		# xml el "$FILE" | grep '/sam' - | xargs -I 'echo {}' 
		VALID=1
	fi
fi

if [[ $VALID -eq 1 ]]; then
	# Process nested
	walk.sh "$FILE"
	# Process plain markup elements
	typed="(//sam[@type and not(./sam) and text()])"
	typedElements=$(xml sel -t -v "count($typed)" "$FILE")	
	echo "There are $typedElements non-nested typed markup elements.";

	if [[ $typedElements > 0 ]]; then	
		for i in $(seq 1 $typedElements);
		do 
			type=$(xml sel -t -v "$typed[$i]/@type" "$FILE");
			filename=$(xml sel -t -v "$typed[$i]/@name" "$FILE");
			outfilename="./sections/$filename"
			rm $outfilename
			xml sel -t -c "$typed[$i]" "$FILE" > $outfilename;
			echo "Looking for file $type.sh";
			if [[ -e "$PREFIX/$type.sh" ]]; then
				echo "Found type $type"
				"$type.sh" "$outfilename" "$filename" "$FILE" > "./output/$filename"
			else
				echo "Unknown type $type"
			fi
		done
	fi


	SEARCH="(//sam[not(@type) and text()])"
	elements=$(xml sel -t -v "count($SEARCH)" "$FILE")
	walk.sh "$FILE"
	echo "There are $elements markup elements.";
	for i in $(seq 1 $elements);
	do 
		node=$SEARCH[$i]
		echo "Node is $node"
		filename=$(xml sel -t -v "$node/@name" "$FILE");
		outfilename="./sections/$filename"
		rm $outfilename;
		xml sel -t -c "$node" "$FILE" > $outfilename;
		if [[ "$DELETE" == "--delete" ]]; then
			echo "Received --delete argument. Deleting original";
			xml ed -P -L --update "$node" --value "" "$FILE"
		fi;
		# git add $outfilename
	done
else
	echo "Ignoring $FILE"		
fi
