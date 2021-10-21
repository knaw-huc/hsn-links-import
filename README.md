# hsn-links-import

Docker version of ingester of HSN. 

Status: "finished"

## pull image

    docker pull mvdpeetje/hsnl_ingester

## obtain data

```
mkdir -p hsnl/dataxml
cd hsnl
cp data to dataxml:
```

(in my case: `cp -rv  ~/dockerprojecten/hsn-links-import/ingest_cbgxml/dataxml/  ./dataxml`

The archive files has to be in a specific directory structure.


## environmental variables

COLLECTION: possible values BSG, BSO, BSH

These are the (development) defaults. From the Dockerfile.prod

```
ENV HOST_LINKS mysqldb
ENV USER_LINKS root
ENV PASSWD_LINKS rood
ENV DBNAME_LINKS links_cleaned

# reference db docker
ENV HOST_REF mysqldb
ENV USER_REF root
ENV PASSWD_REF rood
ENV DBNAME_REF links_general

ENV COLLECTION BSH
ENV INTERACTION no


ENV CBGXML_BSG_DIR  ./dataxml/BSG-2021
ENV CBGXML_BSH_DIR ./dataxml/BSH-2021
ENV CBGXML_BSO_DIR  ./dataxml/BSO-2021

```

### run image

the data is mounted, the network is the docker-network  

You can override them during runtime. For example:
Prerequisites. A running mysql instance, with a network name that you have to adress during runtime.


    docker run --rm -e COLLECTION='BSG' -v $(pwd)/dataxml/:/usr/src/app/dataxml/ --network hsn-links-import_default mvdpeetje/hsnl_ingester:1.0


For development:

See the [development page](https://github.com/knaw-huc/hsn-links-import/blob/main/DEVELOPMENT.md)