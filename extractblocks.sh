#!/bin/bash
NODELETE="--nodelete"
DELETE=${1:-$nodelete}
VALID=0
while read -r line;
	do echo "$line"
	VALID=0
	FILE="$line"
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

		typedElements=$(xml sel -t -v "count(/document/sam[@type])" "$FILE")	
		echo "There are $typedElements typed markup elements.";

		for i in $(seq 1 $typedElements);
		do 
			type=$(xml sel -t -v "/document/sam/@type[$i]" "$FILE");
			echo $type
			filename=$(xml sel -t -v "/document/sam[@type[$i]]/@name" "$FILE");
			echo $type
			if [[ -e "./$type.sh" ]]; then
				echo "Found type $type"
				./$type.sh $filename > $filename\.$type
			else
				echo "Unknown type $type"
			fi
		done


		elements=$(xml sel -t -v 'count(/document/sam)' "$FILE")

		echo "There are $elements markup elements.";
		for i in $(seq 1 $elements);
		do 
			node="document/sam[$i]"
			filename=$(xml sel -t -v "$node/@name" "$FILE");
			rm $filename;
			xml sel -t -c "$node" "$FILE" > $filename;
			if [[ "$DELETE" == "--delete" ]]; then
				echo "Received --delete argument. Deleting original";
				xml ed -L --update "$node" --value "" "$FILE"
			fi;
			git add $filename
		done


		stash=`git stash`; # uncommitted changes are ignored

		needle="HEAD";
		if [[ "$stash" == *"$needle"*  ]]; then
			git stash pop
		else 
			echo "No uncommitted changes on disk."
		fi
	else
		echo "Ignoring $FILE"		
	fi
done < <(git diff-index --name-only HEAD)
