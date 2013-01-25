#!/bin/bash
# Pulls file names from git
NODELETE="--nodelete"
DELETE=${1:-$nodelete}
VALID=0
while read -r line;
do
	./extractfile.sh "$line"	
done < <(git diff-index --name-only HEAD)
