#!/bin/sh

# envsubst < "hsn-links-db-template.yaml" > "hsn-links-db.yaml"
# envsubst < "cleaned2rdf-template.yaml" > "cleaned2rdf.yaml"

/usr/src/app/mk_ingest_cbgxml.py
name=$COLLECTION
# watch it: every space in this date syntax is essential 
datum=$(date +"%Y.%m.%d")
filename=ingest-$name-$datum.sh
echo $filename
sh ./$filename
/usr/src/app/a2a_to_original.py
# rm ./$filename

