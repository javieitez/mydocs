# CheckMK - Check URL for string

How to monitor a website and search for a string in the HTML source, similar as the Nagios command **Check URL for string**

## Create a host for the URL domain

Go to **Setup >> Hosts** and open the folder **HTTPS Servers**

Create a new host or clone one of the existing and modify it

A check for certificate expiration date is automatically created for all the hosts under this folder

## Create a service to check the URL

Instead of creating the service under the host, we need to set up a rule and apply it to an existing host

Go to **Setup >> Services >> HTTP, TCP, Email, ...>> Check HTTP service**

Create a new rule or clone one of the existing ones

Go to **Setup >> Activate pending changes** and click on **Changes >> Activate on selected sites**

# CheckMK create a custom Monitor 

## Overview
The process of creating a custom monitor for CheckMK is conceptually  different as it would be in Nagios. Instead of creating the custom check script in the monitoring server, we're uploading it to the monitored machine.

The script can be any language (Bash, Python, PS, etc... ) as long as it provides the following output
```
0 "My service description" myvalue=73 My output text which may contain spaces
```
`myvalue` can be replaced with a minus sign `-` if the check doesn't provide metrics

## Example Monitor for local backup files

The following example script looks for a backup file in a given path. A subfolder is generated each day with the current date.

```bash
#!/bin/bash
# Quick and dirty script to check if a string exists in a given location
# The path contains a folder with the current date
####### Author: JA Vieitez

MYDATESTRING=$(date +%y%m%d)
MYPATH=/backups/
MYFILE1=todaySQLbackupfile.gz
FILE=$MYPATH$MYDATESTRING/$MYFILE1

if test -f "$FILE"; 
	then
		echo "0 \"Backup file exists\" - $FILE"
	else
		echo "1 \"Backup file not found\" -  $FILE not found"
fi
```

## Add the Script to CheckMK

Upload the script to `/usr/lib/check_mk_agent/local/` and `chmod +x` to make it executable.

Rediscover services for that host, and the new script will appear

## Further Reading

* https://docs.checkmk.com/latest/en/localchecks.html
