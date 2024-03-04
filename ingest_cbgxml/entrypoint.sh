#!/bin/bash

envsubst < "mk_ingest_cbgxml_template.yaml" > "mk_ingest_cbgxml.yaml"
envsubst < "hsn-links-db-template.yaml" > "hsn-links-db.yaml"
# order is important, the second yaml depends on the first one

# check the for correct structure datadirectory
[ ! -d "./dataxml/" ] && echo "WARNING: Directory dataxml does not exist. " && exit 2

# collections=('BSG' 'BSH' 'BSO')

collections=()

[ -d "${CBGXML_BSG_DIR}" ] && echo "BSG directory exist: ${CBGXML_BSG_DIR}" && collections+=("BSG")
[ -d "${CBGXML_BSH_DIR}" ] && echo "BSH directory exist: ${CBGXML_BSH_DIR}" && collections+=("BSH")
[ -d "${CBGXML_BSH_DIR}" ] && echo "BSO directory exist: ${CBGXML_BSO_DIR}" && collections+=("BSO")


if [ ${#collections[@]} -eq 0 ]; then
    echo "WARNING: No directories to parse!"
    exit 3
fi

only_first_run=''
for collectionName in "${collections[@]}"
do
    if [[] -z "$only_first_run" ]]; then
      export CLEAN_BEFORE='0'
      only_first_run='done'
    else
      export CLEAN_BEFORE='0'
    fi

    export COLLECTION=$collectionName
    /usr/src/app/mk_ingest_cbgxml.py

    datum=$(date +"%Y.%m.%d")
    filename=ingest-$collectionName-$datum.sh
    # echo $filename
    sh ./$filename
done

/usr/src/app/a2a_to_original.py

echo -e "SUMMARY\nThese collections where handled: \n"
# echo ${collections[*]}
for collectionName in "${collections[@]}"
do
    if [ $collectionName = "BSG" ]
    then
        echo -e "${CBGXML_BSG_DIR}"
    fi
    if [ $collectionName = "BSH" ]
    then
        echo -e "${CBGXML_BSH_DIR}"
    fi   
    if [ $collectionName = "BSO" ]
    then
        echo -e "${CBGXML_BSO_DIR}\n"
    fi   
done
