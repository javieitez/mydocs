# Configure a Galera Cluster
Let's assume 2 nodes with IPs `10.1.1.101` and `10.1.1.102`. Both nodes have MariaDB and Galera already installed. 

## Configure the first node
Stop the service
```bash
systemctl stop mariadb.service
```
Edit the config file
```bash
vim /etc/mysql/mariadb.conf.d/60-galera.cnf
```
add the following
```conf
# * Galera-related settings

[galera]
wsrep_on                 = 1
wsrep_cluster_name       = "My Motherfuckin Cluster"
wsrep_provider           = /usr/lib/galera/libgalera_smm.so
wsrep_cluster_address    = gcomm://10.1.1.101,10.1.1.102
binlog_format            = row
default_storage_engine   = InnoDB
innodb_autoinc_lock_mode = 2

# Allow server to accept connections on all interfaces.
bind-address = 0.0.0.0
wsrep_node_address=10.1.1.101
```
Create a new cluster and start the service again
```bash
galera_new_cluster && systemctl start mariadb.service
```

### Test the cluster status
```bash
mysql -u root -p
Enter password: 
```
On the MariaDB prompt, type
```sql
SHOW STATUS LIKE 'wsrep_cluster_size';
```
it will return something like
```sql
+--------------------+-------+
| Variable_name      | Value |
+--------------------+-------+
| wsrep_cluster_size | 1     |
+--------------------+-------+
1 row in set (0.002 sec)
```
## Add the second node

On node 2, edit the file `/etc/mysql/mariadb.conf.d/60-galera.cnf` and add the same content as before, but changing the ``wsrep_node_address`` line to reflect the current IP address.

```bash
systemctl restart mariadb-server
```
Repeat the cluster test, this time it will return 2
```sql
+--------------------+-------+
| Variable_name      | Value |
+--------------------+-------+
| wsrep_cluster_size | 2     |
+--------------------+-------+
```
Additional nodes can be added by repeating the process

# Test the cluster replication

login to mariadb in one node and enter
```sql
create database mytestDB;
```
in the other node, enter
```sql
show databases;
```
it will return something like
```sql
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| mytestDB           |
+--------------------+
4 rows in set (0.001 sec)
```
