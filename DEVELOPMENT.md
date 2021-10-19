# DEVELOPMENT DOCUMENTATION

## quickstart Docker development

Purpose: to get you up and running for development

### DATABASES

`docker-compose up -d`


The docker-compose file starts-up a database and adminer.

Run database.sh ONCE

Creates the databases and fills them. 

Run `./database.sh 2>/dev/null`


    cd hsn-links-import/
    ./database.sh 2>/dev/null


Check with adminer http://localhost:8080/

Credentials:    

    mysqldb
    root
    rood


### ORIGINAL XML files

Obtain test data in import folder. Move it to /ingest_cbgxml/dataxml

`cd /hsn-links-import/ingest_cbgxml/dataxml



```
tree .
.
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

### Build standalone image with tags & specific Dockerfile & run
```
    cd ingest_dbgxml
    docker build -t maartenp/testingest:1.0 -f Dockerfile.prod .
    docker images
    # for troubleshootiong and entrypoint overrule https://serverfault.com/questions/594281/how-can-i-override-cmd-when-running-a-docker-image
    docker run --rm -it  --entrypoint bash maartenp/testingest:1.0
    # for running it
    docker run maartenp/testingest:1.0
    # errors, no network no volume
    docker run --rm -v $(pwd)/dataxml/:/usr/src/app/dataxml/ --network hsn-links-import_default maartenp/testingest:1.0
    # determine collection
    docker run --rm -e COLLECTION='BSG' -v $(pwd)/dataxml/:/usr/src/app/dataxml/ --network hsn-links-import_default maartenp/testingest:1.0

    # troubleshooting with network and volumes, override entrypoint
    docker run --rm -it --entrypoint bash -e COLLECTION='BSG' -v $(pwd)/dataxml/:/usr/src/app/dataxml/ --network hsn-links-import_default maartenp/testingest:1.0

    # developing
    docker run --rm -it --entrypoint bash -e COLLECTION='BSG' -v $(pwd)/:/usr/src/app/ --network hsn-links-import_default maartenp/testingest:1.0
    
   
    # with mounting the current dir, it's overriding the included things, then you can build and develop at the same time
    docker run --rm -it  -e COLLECTION='BSG' -v $(pwd)/:/usr/src/app/ -v  $(pwd)/dataxml/:/usr/src/app/dataxml/ --network hsn-links-import_default maartenp/testingest:1.0


```

### End goal

BUILD
- image based on python enriched with a perl stack
- define variables for connection to mysql databases, put them in enviromental variables (for the image)
- write an entrypoint script


RUN
- Mount a directory with xml files
- connect to network with a database server
- give a collection abbreviation in an environmental varible
- run the entrypoint script


```
docker run --rm  -e COLLECTION='BSH'  -v  $(pwd)/dataxml/:/usr/src/app/dataxml/ --network hsn-links-import_default maartenp/testingest:1.0
```

End goal reached.

```
docker run --rm -e COLLECTION='BSH'  -v  $(pwd)/dataxml/:/usr/src/app/dataxml/ --network hsn-links-import_default mvdpeetje/hsnl_ingester:1.1
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


### Run script from outside on the running ingester container

```
docker exec  -e COLLECTION='BSH' -i <dockerContainerID>  /usr/src/app/mk_ingest_cbgxml.py
docker exec  -e COLLECTION='BSO' -i <dockerContainerID>  /usr/src/app/mk_ingest_cbgxml.py
docker exec  -e COLLECTION='BSG' -i <dockerContainerID>  /usr/src/app/mk_ingest_cbgxml.py
```

### Develop with docker-compose 


```
docker-compose stop ingester
# change Dockerfile
docker-compose build ingester
docker-compose  up -d  ingester
```

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


### Run

```
docker run -d -v $(pwd)/ingest_cbgxml:/usr/src/app/ --name ingester_cont -it hsn-links-import_ingester:latest

docker exec -i ingester_cont  env


docker exec -it ingester_cont  bash
# let op it 

```

### Push to Dockerhub

On Dockerhub. Create repository mvdpeetje/hsnl_ingester

    docker tag maartenp/testingest:1.0 mvdpeetje/hsnl_ingester:1.0
    docker push mvdpeetje/hsnl_ingester:1.0

For a new tab
    docker push mvdpeetje/hsnl_ingester:tagname

Getest:
    docker image rm mvdpeetje/hsnl_ingester:1.0 
    docker pull mvdpeetje/hsnl_ingester:1.0


Wrote instructions:
docker pull mvdpeetje/hsnl_ingester:1.0
mkdir -p hsnltest/dataxml
cd hsnltest

cp datadirectories to dataxml:

(in my case: cp -rv  ~/dockerprojecten/hsn-links-import/ingest_cbgxml/dataxml/  ./dataxml)

The archive files has to be in a specific directory structure:

ENVIRONMENTAL VARIABLES:

COLLECTION: possible values BSG, BSO, BSH

These are the (development) defaults. From the Dockerfile.prod

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

You can override them during runtime. For example:
Prerequisites. A running mysql instance, with a network name that you have to adress during runtime.


    docker run --rm -e COLLECTION='BSG' -v $(pwd)/dataxml/:/usr/src/app/dataxml/ --network hsn-links-import_default mvdpeetje/hsnl_ingester:1.0

And it works! Per collection.


### Scripts and Databases

#### mk_ingest_cbgxml.py 

input: a collection of N xml files
output: a shell script with N calls to import_a2a_auto.pl
uses links_general as a lookup database
uses mk_ingest_cbgxml.yaml for paths
uses hsn_links-db.yaml for db-credential lookup database links_general

#### import_a2a_auto.pl 

arg 2: host
arg 6: user
arg 7: pwd
parses xml files and conversion to link_a2a database
drops and create all the tables during this process, but not registration_o_temp and person_o_temp

That will taken care of by the next script.

#### a2a_to_original.py

converts links_a2a to links_original
It uses a2a_to_original.sql for it's queries. 
It parses de .sql file and execute the queries. 
There logged.



first truncate the two temp tables in links_a2a 

TRUNCATE TABLE links_a2a.registration_o_temp ;
TRUNCATE TABLE links_a2a.person_o_temp ;


hsn_links_db.py is a database help file, also for mk_ingest_cbgxml



