#!/bin/sh

# envsubst < "hsn-links-db-template.yaml" > "hsn-links-db.yaml"
# envsubst < "cleaned2rdf-template.yaml" > "cleaned2rdf.yaml"

/usr/src/app/mk_ingest_cbgxml.py
cat requirements.txt

