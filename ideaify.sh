#!/bin/bash

FILE="$1"
TAG=$(expr "$FILE" : '\(.*\)\.')


TEXT=$(cat <(sed "s@NAME@$TAG@g" documentprefix) <(gsed -e '1s/^\xef\xbb\xbf//' "$FILE") documentsuffix)

echo "$TEXT" > "$FILE"
