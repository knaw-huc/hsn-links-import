# hsn-links-import

Docker version of ingester of HSN. 

Status: in development

## Docker development

<!-- Start Virtual Environment (cre)
`source hsn-links-import/bin/activate` -->

### Via docker-compose 

first time:
```
docker-compose build --no-cache ingester
```

later:
```
docker-compose build ingester
docker-compose up -d
# bind mount ./  network created by docker-compose `docker network ls`
docker run -v $(pwd):/usr/src/app/--network hsn-links-import_default -it hsn-links-import_ingester  bash
# run python script
./mk_ingest_cbgxml.py
mysql -uroot -prood -hmysqldb
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


## Setup (only once):

Create Virtual Environment

```
python3 -m venv hsn-links-import/
source hsn-links-import/bin/activate
cd hsn-links-import/
python3 -m pip install pyyaml
python3 -m pip install arrow
python3 -m pip install tablib
python3 -m pip install mysql-connector
python3 -m pip install pymysql
python3 -m pip install mysql-connector-python
pip freeze > requirements.txt # for docker
```

### Create database helper

`docker exec -i <dockerid> mysql -uroot -prood  -e "create database links_general"`

`docker exec -i <dockerid> mysql -uroot -prood -Dlinks_general < ref_source.sql`



## up & running after dockerization






```
docker-compose build  ingester
docker-compose run ingester
```