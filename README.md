# hsn-links-import

Docker version of ingester of HSN. 

Status: in development

## Docker development


### quickstart

`docker-compose up -d`


Once:

Create and fill `links_general` database.

`cd hsn-links-import`
`docker exec -i hsn-links-import_mysqldb_1  mysql -uroot -prood  -e "create database links_general"`
`docker exec -i hsn-links-import_mysqldb_1  mysql -uroot -prood -Dlinks_general < ref_source.sql`
`docker exec -i hsn-links-import_mysqldb_1  mysql -uroot -prood  -e "create database links_a2a"`


`docker exec -it hsn-links-import_ingester_1  bash`

In the container:

`./mk_ingest_cbgxml.py`

Run the shell-script:
`sh ingest-BSH-2021.09.16.sh`



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
docker run -v $(pwd):/usr/src/app/ --network hsn-links-import_default -it hsn-links-import_ingester  bash
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



Example:
```
docker exec -i hsn-links-import_mysqldb_1  mysql -uroot -prood  -e "create database links_general"
docker exec -i hsn-links-import_mysqldb_1  mysql -uroot -prood  -e "create database links_a2a"
docker exec -i hsn-links-import_mysqldb_1  mysql -uroot -prood  -e "create database links_cleaned"
docker exec -i hsn-links-import_mysqldb_1  mysql -uroot -prood -Dlinks_general < ref_source.sql
```



## up & running after dockerization






```
docker-compose build  ingester
docker-compose run ingester
```