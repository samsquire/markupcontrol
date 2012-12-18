#!/bin/bash
NODELETE="--nodelete"
DELETE=${1:-$nodelete}
echo "Delete is $DELETE"
while read -r line;
	do echo "$line"
	echo "Now extracting blocks";
	FILE="$line"
	validation=`xml val $FILE`
	if [[ "$validation" == *"invalid"*  ]]; then
		echo "Unrecognised file - wrapping in markup."
		gsed -i '1i\<document>\' "$FILE"
		gsed -i '$a\<\/document>' "$FILE"

	else 
		echo "File already wrapped."
		xml el "$FILE" | grep '/sam' - | xargs -I 'echo {}' 
	fi

	elements=$(xml sel -t -v 'count(/document/sam)' "$FILE")

	echo "There are $elements";
	for i in $(seq 1 $elements);
	do 
		node="document/sam[$i]"
		filename=$(xml sel -t -v "$node/@name" "$FILE");
		rm $filename;
		xml sel -t -c "$node" "$FILE" > $filename;
		echo "$DELETE";
		if [[ "$DELETE" == "--delete" ]]; then
			echo "Deleting original";
			xml ed -L --update "$node" --value "" "$FILE"
		fi;
		git add $filename
	done


	stash=`git stash`; # uncommitted changes are ignored
	echo $stash;

	needle="HEAD";
	if [[ "$stash" == *"$needle"*  ]]; then
		git stash pop
	else 
		echo "No popping"
	fi
done < <(git diff-index --name-only HEAD)
