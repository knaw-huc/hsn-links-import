#!/bin/sh



echo 'links_general'
docker exec -i hsn-links-import_mysqldb_1  mysql -uroot -prood  -e "create database links_general" # also created with startup docker-compose mysqldb service
docker exec -i hsn-links-import_mysqldb_1  mysql -uroot -prood -Dlinks_general < sql/links_general/ref_source.sql


echo 'links_a2a'
docker exec -i hsn-links-import_mysqldb_1  mysql -uroot -prood  -e "create database links_a2a"
docker exec -i hsn-links-import_mysqldb_1  mysql -uroot -prood -Dlinks_a2a < sql/links_a2a/person_o_temp.sql
docker exec -i hsn-links-import_mysqldb_1  mysql -uroot -prood -Dlinks_a2a < sql/links_a2a/registration_o_temp.sql

echo 'links_original'
docker exec -i hsn-links-import_mysqldb_1  mysql -uroot -prood  -e "create database links_original"
docker exec -i hsn-links-import_mysqldb_1  mysql -uroot -prood -Dlinks_original < sql/links_original/person_o.sql
docker exec -i hsn-links-import_mysqldb_1  mysql -uroot -prood -Dlinks_original < sql/links_original/registration_o.sql
