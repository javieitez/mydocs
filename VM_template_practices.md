# Reset all SSH Keys

## Debian 
```
rm -v /etc/ssh/ssh_host_*
```
```
dpkg-reconfigure openssh-server
```
```
systemctl restart ssh
```
