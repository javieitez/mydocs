# Icinga - CheatSheet

## Commands
list all host objects 
```shell
icinga2 object list --type Host
```
Commands are located at `/usr/lib/nagios/plugins`

## Restart Icinga

validate the configuration **before** restarting the service
```shell
icinga2 daemon -C
```
Then restart
```shell
systemctl restart icinga2 && systemctl status icinga2 --no-pager
```
