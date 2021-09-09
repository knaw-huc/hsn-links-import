# LOG

## 9-9-2021

- walking through the ingest.py file
- added more dependencies to requirements
- started with a python virtual env for development, quicker testing
- moved configuration files to main folder ingest_cbgxml
- added hsn_links_db.py to main folder

MySQL via Docker, up in the air
- port mapping is essential, it's not a default if you leave it out

```
docker exec -i c9 mysql -uroot -prood  -e "create database links_general"
docker exec -i c9 mysql -uroot -prood  -e "create database links_original"
```

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

- .sh files are created!
- TODO, the tables should be created, it's not automatically
- 
```
MySQLdb._exceptions.ProgrammingError: (1146, "Table 'links_general.ref_source' doesn't exist")

```

## 8-9-2021

- setup for Docker
- tested it, it works
- separation from main repos
