DEST="$1"
NAME="$2"
xml="application/xml"
TYPE=${4:-$xml}

curl --user admin:admin \
 	-H "Accept: $TYPE" \
	-X GET \
 	"http://localhost:8660/exist/rest/db/sam/$DEST/$NAME"
