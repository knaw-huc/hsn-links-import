FROM python:3.9-slim-buster
# https://pythonspeed.com/articles/base-image-python-docker-images/

WORKDIR /usr/src/app

# PERL and some CPAN modules are required
# some of the CPAN modules require gcc and make

RUN apt-get update 
RUN apt-get install -y cpanminus
RUN (echo y;echo o conf prerequisites_policy follow;echo o conf commit)|cpan
# https://stackoverflow.com/questions/3462058/how-do-i-automate-cpan-configuration

RUN apt-get install -y make
RUN apt-get install -y gcc
RUN cpan App::cpanminus
RUN cpanm DBI


# RUN cpanm XML::Parser
# RUN cpanm XML::Simple

# necessary for mysql
# https://stackoverflow.com/questions/4729722/trying-to-install-perl-mysql-dbd-mysql-config-cant-be-found
RUN apt-get install -y libmariadb-dev-compat
RUN cpanm DBD::mysql

# RUN cpanm XML::Parser
# RUN cpanm XML::Simple

RUN apt-get install -y expat 
RUN apt-get install -y libxml-parser-perl
RUN cpanm XML::Simple
# https://stackoverflow.com/questions/9693031/how-to-install-xmlparser-without-expat-devel


# COPY mk_ingest_cbgxml.py mk_ingest_cbgxml.py
# COPY import_a2a_auto.pl import_a2a_auto.pl 
# COPY a2a_xml.py a2a_xml.py
# COPY mk_ingest_cbgxml.yaml mk_ingest_cbgxml.yaml 
# COPY hsn-links-db.yaml hsn-links-db.yaml

# mysqlclient
RUN apt update && \
    apt install gettext-base default-mysql-client -y && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*


COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt

# CMD ["python3", "mk_ingest_cbgxml.py"]
CMD ["bash"]

