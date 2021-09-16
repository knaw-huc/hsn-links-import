# DEVELOPMENT DOCUMENTATION

## quickstart Docker development

Purpose: to get you up and running

`docker-compose up -d`

Once:

### DATABASES

Create them and fill them. ONCE (TODO script it)

```bash
cd hsn-links-import/

docker exec -i hsn-links-import_mysqldb_1  mysql -uroot -prood  -e "create database links_general"
docker exec -i hsn-links-import_mysqldb_1  mysql -uroot -prood -Dlinks_general < sql/links_general/ref_source.sql

docker exec -i hsn-links-import_mysqldb_1  mysql -uroot -prood  -e "create database links_a2a"
docker exec -i hsn-links-import_mysqldb_1  mysql -uroot -prood -Dlinks_a2a < sql/links_a2a/person_o_temp.sql
docker exec -i hsn-links-import_mysqldb_1  mysql -uroot -prood -Dlinks_a2a < sql/links_a2a/registration_o_temp.sql


docker exec -i hsn-links-import_mysqldb_1  mysql -uroot -prood  -e "create database links_original"
docker exec -i hsn-links-import_mysqldb_1  mysql -uroot -prood -Dlinks_original < sql/links_original/person_o.sql
docker exec -i hsn-links-import_mysqldb_1  mysql -uroot -prood -Dlinks_original < sql/links_original/registration_o.sql
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
