# LOG


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