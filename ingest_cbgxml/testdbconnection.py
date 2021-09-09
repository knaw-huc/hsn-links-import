#!/usr/bin/env python
# -*- coding: utf-8 -*-

import MySQLdb

# mysql -uroot -prood --port=8001 -hlocalhost --protocol=tcp # dit werkt van buiten de container
# mysql -uroot -prood -hlocalhost --protocol=tcp # dit werkt van buiten de container ook deze als je 3306 aanhoud...


# https://mysqlclient.readthedocs.io/user_guide.html
# https://stackoverflow.com/questions/23234379/installing-mysql-in-docker-fails-with-error-message-cant-connect-to-local-mysq
# https://stackoverflow.com/questions/62856250/python-connect-mysql-through-localhost-not-working-but-127-0-0-1-is-working


# antwoord door host te veranderen naar 127.0.0.1 was het antwoord...
# connectie = MySQLdb.connect(host = 'localhost', user = 'root', passwd = 'rood', db = 'links_general', port=8001, unix_socket='tcp')

hhost = 'localhost'
hhost = '127.0.0.1'

db = MySQLdb.connect(host = hhost, user = 'root', passwd = 'rood')

# Check if connection was successful
if (db):
    print("testdb connection")

# Carry out normal procedure
    print ("Connection successful")
    cursor = db.cursor()

# execute SQL query using execute() method.
    cursor.execute("SELECT VERSION()")

# Fetch a single row using fetchone() method.
    data = cursor.fetchone()
    print ("Database version : %s " % data)

# disconnect from server
    db.close()
else:   
# Terminate
    print ("Connection unsuccessful")