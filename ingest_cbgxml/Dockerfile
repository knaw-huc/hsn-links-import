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

# necessary for mysql
# https://stackoverflow.com/questions/4729722/trying-to-install-perl-mysql-dbd-mysql-config-cant-be-found
RUN apt-get install -y libmariadb-dev-compat
RUN cpanm DBD::mysql@4.052

RUN apt-get install -y expat 
RUN apt-get install -y libxml-parser-perl
RUN cpanm XML::Simple
# https://stackoverflow.com/questions/9693031/how-to-install-xmlparser-without-expat-devel


# Install envsubst tool for adding env variables to config file 
RUN apt update && \
    apt install gettext-base  -y && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*


COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt

# dbcredentials result database
ENV MYSQL_LINKS_HOSTURL mysqldb
ENV MYSQL_LINKS_USERNAME root
ENV MYSQL_LINKS_PASSWORD rood

# reference db docker
ENV MYSQL_REF_HOSTURL mysqldb
ENV MYSQL_REF_USERNAME root
ENV MYSQL_REF_PASSWORD rood
ENV DBNAME_REF links_general

# data directory structure
ENV CBGXML_BSG_DIR  ./dataxml/BSG
ENV CBGXML_BSH_DIR ./dataxml/BSH
ENV CBGXML_BSO_DIR  ./dataxml/BSO

# for the script (s)
ENV INTERACTION no
ENV LOGGIE no
ENV CLEAN_BEFORE 1

COPY . .

ENTRYPOINT ["bash", "/usr/src/app/entrypoint.sh"]

