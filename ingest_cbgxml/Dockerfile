FROM python:3.9-slim-buster
# https://pythonspeed.com/articles/base-image-python-docker-images/
WORKDIR /usr/src/app

COPY requirements.txt requirements.txt
# COPY mk_ingest_cbgxml.py mk_ingest_cbgxml.py
# COPY import_a2a_auto.pl import_a2a_auto.pl 
# COPY a2a_xml.py a2a_xml.py
# COPY mk_ingest_cbgxml.yaml mk_ingest_cbgxml.yaml 
# COPY hsn-links-db.yaml hsn-links-db.yaml

RUN pip install -r requirements.txt

CMD ["python3", "mk_ingest_cbgxml.py"]
