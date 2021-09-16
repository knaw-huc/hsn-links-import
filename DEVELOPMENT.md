# DEVELOPMENT DOCUMENTATION

## quickstart Docker development

Purpose: to get you up and running

`docker-compose up -d`

Once:

### DATABASES

Create them and fill them. 
Run `./database.sh 2>/dev/null`



```bash
cd hsn-links-import/
./database.sh 2>/dev/null
```

Check with adminer.

http://localhost:8080/

Credentials:

```
mysqldb
root
rood
```


### ORIGINAL XML files

Obtain test data in import folder. Move it to /ingest_cbgxml/

`cd /hsn-links-import/ingest_cbgxml/import



```tree

tree source
source
├── BSG-2021
│   ├── A2A_BSG_2021-04_NA#Gemeentearchief\ Oegstgeest.xml
│   └── A2A_BSG_2021-04_NA#Gemeentearchief\ Wassenaar.xml
├── BSH-2021
│   ├── A2A_BSH_2021-04_NA#Gemeentearchief\ Oegstgeest.xml
│   └── A2A_BSH_2021-04_NA#Gemeentearchief\ Wassenaar.xml
└── BSO-2021
    ├── A2A_BSO_2021-04_NA#Gemeentearchief\ Oegstgeest.xml
    └── A2A_BSO_2021-04_NA#Gemeentearchief\ Wassenaar.xml

3 directories, 6 files

```


### In the container

`docker exec -it hsn-links-import_ingester_1  bash`

In the container, run this Python script: 

`./mk_ingest_cbgxml.py`

Output: shell script for running perl-scripts, with the right parameters.

Run the shell-script.

`sh ingest-BSH-<DATE>.sh`

Output: the database links_a2a, with the tables person_o_temp and registration_o_temp

Run the python script:

`a2a_to_original.py`


### BUILD PROCESS via docker-compose 


first time:
```
docker-compose build --no-cache ingester
```

later:
```
docker-compose build ingester
docker-compose up -d
# bind mount ./  network created by docker-compose `docker network ls`
docker run -v $(pwd):/usr/src/app/ --network hsn-links-import_default -it hsn-links-import_ingester  bash
# run python script
./mk_ingest_cbgxml.py

```

### Separate Dockerfiles

```
cd ingest_cbgxml
docker build  -t hsn_ingester .

docker run -v $(pwd):/usr/src/app/ --network hsn-links-import_default -it hsn-links-import_ingester  bash
# in the container
# connect to db
mysql -uroot -prood -hmysqldb 

# run python script
./mk_ingest_cbgxml.py

```
