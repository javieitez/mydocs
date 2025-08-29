#!/bin/bash

# Quick and dirty script to send a SQL query to an MS SQL DB and parse the output
#
# Author: JA Vieitez
#
# Requires sqlcmd https://learn.microsoft.com/en-us/sql/linux/sql-server-linux-setup-tools?view=sql-server-ver16
# 

#get the necessary values from the command arguments
SERVER=$1
DATABASE=$2
USER=$3
PASSWORD=$4 
QUERY=$5

if [ $1 == '-h' ]
	then
		echo "Usage:  check_sqlcmd.sh SERVER DATABASE USER PASSWORD QUERY"
		echo ""
		echo "Example: check_sqlcmd.sh 10.10.10.10 MYDATABASE sa 1234 \"SELECT name FROM sys.databases\""
		exit 3
fi

sqlcmd -S $SERVER -d $DATABASE -U $USER -P $PASSWORD -Q $QUERY
#capture the exit code
LASTEXITCODE=$? 

if [ $LASTEXITCODE == 0 ] 
	then
		# Connection successful
		echo "OK - successfully connected to is $DATABASE"
		exit 0
	else
		echo "CRITICAL - could no connect to $DATABASE"
		exit 2
fi
