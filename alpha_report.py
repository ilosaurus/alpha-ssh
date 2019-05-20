#!/usr/bin/env python
import mysql.connector
import sys
import Server

def main():
    db_user = 'root'
    db_password = 'strong_password'
    db_name = 'ssh_access_reports'
    db_host = '35.154.187.227'
    db_table = 'report'


    print "Connecting to mysql."
    connection = Server.initiate_db_connection(db_user,db_password,db_host)

    print "Getting data from database"
    query = 'SELECT * FROM %s.%s' %(db_name,db_table)
    response = Server.db_execute(connection,query,True)
    print " --------------------------------"
    print "| Metrics for ssh log-in attempts|"
    print "|--------------------------------|"
    for row in response:
        print "| * %s had %d attempt" %(row[1],row[2])

    print " --------------------------------"

if __name__ == "__main__":
    main()