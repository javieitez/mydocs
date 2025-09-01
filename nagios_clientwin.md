# Nagios - Install NSClient++ on a Windows host

Download the client from https://www.nsclient.org/download/ and install it with the default options.

Edit the file `nsclient.ini` located at `C:\Program Files\NSClient++` and make sure it matches the following configuration:

* a password is set
* the line `allowed hosts` contains a comma separated list of IPs that are allowed to remotely query the service for system information. The Nagios or Icinga server IP must be added here.

``` ini
# If you want to fill this file with all available options run the following command:
#   nscp settings --generate --add-defaults --load-all
# If you want to activate a module and bring in all its options use:
#   nscp settings --activate-module <MODULE NAME> --add-defaults
# For details run: nscp settings --help

[/settings/default]
password = set_a_password_here
allowed hosts = 127.0.0.1

[/settings/NRPE/server]
verify mode = none
insecure = true

[/modules]
CheckExternalScripts = enabled
CheckHelpers = enabled
CheckEventLog = enabled
CheckNSCP = enabled
CheckDisk = enabled
WEBServer = disabled
CheckSystem = enabled
NSClientServer = enabled
NRPEServer = enabled
```
