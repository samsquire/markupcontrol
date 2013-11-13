FILE="$1"

# WikiLinks to Markdown links
# WikiLink names to .html links
# WikidPad headings to Markdown headings
# Replace multiple spaces with one
# gsed -r -e 's@[A-Z]([A-Z0-9]*[a-z][a-z0-9]*[A-Z]|[a-z0-9]*[A-Z][A-Z0-9]*[a-z])[A-Za-z0-9]*@[\0](\0.html)@g' \
# ssed -e 's@\[\(.*\)\]\($\|\s\)@[\0](\0.html)\0@g' \
ssed	-e 's@\+@#@g' \
			-e 's@^\s*\*@ *@g' "$FILE"

