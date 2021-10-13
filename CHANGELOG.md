# LOG


## 13-10-2021

TODO
- database from perl or something else
- logging? Turn it off or redirect or surplant it with something else
- enviromental variables with envsubst (KM trick)
- discuss
- integration with other containers

BUILD

docker build -t maartenp/testingest:1.0 -f Dockerfile.prod .

RUN

docker run --rm -it  -e COLLECTION='BSG'  -v  $(pwd)/dataxml/:/usr/src/app/dataxml/ --network hsn-links-import_default maartenp/testingest:1.0

- it runs!
- rm containres after use
- entrypoint scripts

## 30-9-2021

TODO
- connect python and perl script
DONE
- docker run command that works with mounted volume and network and parameter for collection (the first part)
- added .Dockerignore file
- separate Dockerfiles for development & production
- environment variables during runtime exec script overrides the ones in Dockerfile, example in development.md
- removed interaction with ENV INTERACTION
- experiments with standalone containers and entrypoint.sh

## 2021-10-13

- production version
- development flow improvements: focus on creating the docker image 

## 2021-09-17

- environment variables via Dockerfile


TODO
- remove the ask for input thing
- script the pipeline
- <strike> scripten the database commands</strike>
- dockerize, use more env's

## 2021-09-16

- follow the instructions test succeeded from scratch development instructions, with removed images, containers and volumes etc.
- rewrote instructions
- housecleaning

SOLVED BUGS

- all related to the missing database with right tables, added sql files to the repos
- made some development documentation, wrote down the steps for a quickstart development.md
- added adminer to the stack for mysql interactions and table checking

## 2021-09-15

<strike>TODO BUGS </strike>
- MySQLdb._exceptions.ProgrammingError: (1146, "Table 'links_a2a.registration_o_temp' doesn't exist")
- MySQLdb._exceptions.ProgrammingError: (1146, "Table 'links_a2a.person_o_temp' doesn't exist")
- temp tables for person and registration are missing in links_a2a

These should have been build with the perl script.

In the perlscript:

`The 2 remaining tables (person_o_temp and registration_o_temp) are not used by this script, ` ln 138


- a2a_to_original.yaml does not exist en a2a_to_original.py asks for it

- added a a2a_to_original.yaml

- added a create database (only development?)
- from now, ignore running from the host, run the scripts from within container
- added mysql client for testing
- https://stackoverflow.com/questions/43102442/whats-the-difference-between-mysqldb-mysqlclient-and-mysql-connector-python
- removed mysql-connector and replaced it with mysqlclient


## 2021-09-10

- created mysql help table, for conversion
- perl with cpan modules in Dockerfile, lot of searching and trial and error
- shell script with calls with right parameters to perlscript are now generated

## 2021-09-9

- walking through the ingest.py file
- added more dependencies to requirements
- started with a python virtual env for development, quicker testing
- moved configuration files to main folder ingest_cbgxml
- added hsn_links_db.py to main folder

MySQL via Docker, up in the air
- port mapping is essential, it's not a default if you leave it out


- mysql -uroot -prood --port=8001 -hlocalhost --protocol=tcp # it worked
- connection from python did'nt work =>> troubleshooting with testdbconnection.py
    - included all the possible mysql modules...
    - checked grants within mysql
    - 
- Solved: you NEED to use 127.0.0.1 from Python... No DNS resolve, like PHP
- 
Problems? Discuss
- Explicitly directory name like BSG is required for parsing. 
- Explicite adding confirmation prompt is necessary, 

- .sh files are created, it has something to do with this: vvv
- TODO, the tables should be created, it's not automatically

```
MySQLdb._exceptions.ProgrammingError: (1146, "Table 'links_general.ref_source' doesn't exist")

```

- changed docker-compose to pure mysql (is used for the database in production)
- and in 'pure' mysql (5.7. is used here) also `mysql -h127.0.0.1 -p3306 -uroot -p`  localhost is not used (socket)


## 2021-09-8

- setup for Docker
- tested it, it works
- separation from main repos
