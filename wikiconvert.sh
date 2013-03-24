FILE="$1"

# WikiLinks to Markdown links
# WikiLink names to .html links
# WikidPad headings to Markdown headings
# Replace multiple spaces with one
gsed -e 's@^[A-Z]\([A-Z0-9]*[a-z][a-z0-9]*[A-Z]\|[a-z0-9]*[A-Z][A-Z0-9]*[a-z]\)[A-Za-z0-9]*@[\0]@g' \
 	-e 's@\[\(.*\)\]\($\|\s\)@[\1](\1.html)\2@g' \
	-e 's@+@#@g' \
 	-e 's@^\s*\(.*\)\*@\* \1@g' "$FILE"
