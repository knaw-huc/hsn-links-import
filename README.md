# hsn-links-import

Docker version of ingester of HSN. 

Status: "finished"

## pull image

    docker pull mvdpeetje/hsnl_ingester

## obtain data

```
mkdir -p hsnl/dataxml
cd hsnl
```

Move XML data to dataxml.
The archive files has to be in a specific directory structure.
Every 'collection', birth (BSG), mariage (BSH) and death (BSD), should be in a seperate directory.
Make a note of the directories. Prefered directory structure



(in my case: `cp -rv  ~/dockerprojecten/hsn-links-import/ingest_cbgxml/dataxml/  ./dataxml`



## environmental variables


These are the  defaults. 
See the Dockerfile in ingest_cbgxml


### run image

The xml-data is mounted into the container, the destination should be `/usr/src/app/dataxml/`
The network is the network needed for the mysql

You can override them during runtime. For example:
Prerequisites. A running mysql instance, with a network name that you have to adress during runtime.


    docker run --rm  -v $(pwd)/dataxml/:/usr/src/app/dataxml/ --network hsn-links-import_default mvdpeetje/hsnl_ingester


For development:

See the [development page](https://github.com/knaw-huc/hsn-links-import/blob/main/DEVELOPMENT.md)