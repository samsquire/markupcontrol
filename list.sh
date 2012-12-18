#!/bin/bash

while read -r line;
	do echo "$line"
done < <(git diff-index --cached --name-only HEAD)
