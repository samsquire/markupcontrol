#!/bin/sh

FILE=$1

elements=$(xml sel -t -v 'count(/document/sam)' "$FILE")

echo "There are $elements";
for i in $(seq 1 $elements);
do 
	node="document/sam[$i]"
	reversenode="/sam[1]"
	echo "Reversing $node"
	VALUE=$(xml sel -t -v /sam $FILE)
	echo "$VALUE"
	filename=$(xml sel -t -v "$node/@name" "$FILE");
	echo $filename
	# extract text back out
	echo $reversenode;
	TEXT=$(xml sel -t -v "$reversenode" $filename);
	echo $TEXT
	xml ed -L --update "$node" --value "$TEXT" $FILE
done

