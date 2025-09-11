Make sure firewalld is up and running 
```bash
systemctl status firewalld
```
or
```bash
firewall-cmd --state
```
## List open ports
```bash
firewall-cmd --list-all
```
## Open port
```bash
firewall-cmd --add-port=port-number/port-type
```
Make changes persistent
```bash
firewall-cmd --runtime-to-permanent
```
## Common ports

|Service |Port |type |
|--|--|--|
|http|80|TCP|
|https|443|TCP|


