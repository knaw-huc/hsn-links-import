#!/bin/sh

envsubst < "mk_ingest_cbgxml_template.yaml" > "mk_ingest_cbgxml.yaml"

envsubst < "hsn-links-db-template.yaml" > "hsn-links-db.yaml"

# order is important, the second yaml depends on the first one

/usr/src/app/mk_ingest_cbgxml.py
name=$COLLECTION
# watch it: every space in this date syntax is essential 
datum=$(date +"%Y.%m.%d")
filename=ingest-$name-$datum.sh
echo $filename
sh ./$filename
/usr/src/app/a2a_to_original.py
# rm ./$filename

