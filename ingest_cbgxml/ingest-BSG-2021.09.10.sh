#!/bin/sh

# Project LINKS, KNAW IISH
# 2021.09.10

# perl parameters:
# [Perl File] [XML File] [db URL] [id_source] [registration_maintype] [drop-and-create] [db usr] [db pwd]
# [drop-and-create]: first xml file:  1 = truncate a2a tables
# [drop-and-create]: other xml files: 0 = keep a2a tables contents


date "+%F %T"

perl /Users/mvdpeet/dockerprojecten/hsn-links-import/ingest_cbgxml/import_a2a_auto.pl "/Users/mvdpeet/dockerprojecten/hsn-links-import/import/source/BSG-2021/A2A_BSG_2021-04_NA#Gemeentearchief Oegstgeest.xml" 127.0.0.1 231 1 1 root rood
perl /Users/mvdpeet/dockerprojecten/hsn-links-import/ingest_cbgxml/import_a2a_auto.pl "/Users/mvdpeet/dockerprojecten/hsn-links-import/import/source/BSG-2021/A2A_BSG_2021-04_NA#Gemeentearchief Wassenaar.xml" 127.0.0.1 242 1 0 root rood

date "+%F %T"

# [eof]
