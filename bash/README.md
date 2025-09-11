This folder contains some useful scripts. 

Most of them are quick and dirty solutions to everyday problems

 * `check_service_string` save the status of a service to a temp file, then search it for a string
 * `check_url_pcre.sh`: Finds a Perl Compatible RegExp in a remote url (web, webservice, etc...)
 * `check_url_pcre_xml.sh`: Same as check_url_pcre, but returns an integer from an XML field, which is compared with a provided value. This can trigger a Nagios alert when a threshold is exceeded.   
 * `comparediff.sh`: compares the content of fileA, line by line, with the content of fileB, and writes the output to outputfile
 * `fetchlicenses.sh`: retrieves an integer from an XML based webservice, returns OK or ERROR based on a given threshold
 * `fetchremotelogs.sh`: retrieves a series of log files from each server on a cluster, and counts the repetitions of a given string in them
 * `simpleSQLbackup.sh`: A simple backup script that can be scheduled to make a backup of an existing DB and a series of files, and then upload them to a remote place

Instead of __ready-to-run__ scripts, these files are intended to be used as a template for more complicated scripts.
