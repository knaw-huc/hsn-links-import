# hsn-links-import

Docker version of ingester of HSN. 

Status: in development

## development

python3 -m venv hsn-links-import/
. hsn-links-import/bin/activate

In de venv:

```
cd hsn-links-import/
python3 -m pip install pyyaml
python3 -m pip install arrow
python3 -m pip install tablib
python3 -m pip install mysql-connector
python3 -m pip install pymysql
python3 -m pip install mysql-connector-python
pip freeze > requirements.txt
```

## up & running

```
docker-compose build  ingester
docker-compose run ingester
```