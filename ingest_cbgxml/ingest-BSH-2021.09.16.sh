#!/bin/sh

# Project LINKS, KNAW IISH
# 2021.09.16

# perl parameters:
# [Perl File] [XML File] [db URL] [id_source] [registration_maintype] [drop-and-create] [db usr] [db pwd]
# [drop-and-create]: first xml file:  1 = truncate a2a tables
# [drop-and-create]: other xml files: 0 = keep a2a tables contents


date "+%F %T"

perl ./import_a2a_auto.pl "./import/source/BSH-2021/A2A_BSH_2021-04_NA#Gemeentearchief Oegstgeest.xml" mysqldb 231 2 1 root rood
perl ./import_a2a_auto.pl "./import/source/BSH-2021/A2A_BSH_2021-04_NA#Gemeentearchief Wassenaar.xml" mysqldb 242 2 0 root rood

date "+%F %T"

# [eof]
