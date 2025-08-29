# Move Data Dir to another path
Create the dir and set the right permissions

```bash
mkdir /SOME-PATH/mysql
chown mysql:mysql /SOME-PATH/mysql/
chmod 755 /SOME-PATH/mysql/
```
Stop the service
```bash
systemctl stop mariadb.service
```
Edit the config file (path and file might differ)
```bash
vim /etc/mysql/mariadb.conf.d/50-server.cnf
```
Find the `datadir` line and replace the current path

```ini
# * Basic Settings
user                    = mysql
pid-file                = /run/mysqld/mysqld.pid
basedir                 = /usr
#datadir                 = /var/lib/mysql
datadir                 = /SOME-PATH/mysql
tmpdir                  = /tmp
lc-messages-dir         = /usr/share/mysql
lc-messages             = en_US
```
Start the service again
```bash
systemctl start mariadb.service
```

# Reconfigure MariaDB

```bash
mysql_secure_installation
```
