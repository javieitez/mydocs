## Pre-Installation steps 
### Disable UEFI Secure Boot

We need to add an unsigned kernel module, which is restricted by default in UEFI systems.

Power off the VM and **Edit Settings** >> **VM Options** >> **Boot Options** and uncheck **Secure Boot**

![change this](img/secure_boot.png)

## Installation
### CentOS/Redhat
Check your current repos with `dnf repolist`. If there are any entries related to zfs, delete them. If a former release of zfs is installed, it also must be uninstalled too.

Check your OS release: `cat /etc/redhat-release`

Check the required repo for your OS version [here](https://openzfs.github.io/openzfs-docs/Getting%20Started/RHEL-based%20distro/index.html).

Once you get the right link, install it with `dnf install [URL]` 
```bash
dnf install http://download.zfsonlinux.org/epel/zfs-release.el8_6.noarch.rpm
```
After installation, check if the module loads
```bash
/sbin/modprobe zfs -
```
If no output all is returned, that's OK. Then run `zfs version` to check if it's actually installed and running.

### Debian/Ubuntu
TBA

## Set up a ZFS pool
Data pools are created and mounted directly with `zpool`, without the need of creating partitions with `fdisk` or adding them to `/etc/fstab`  

### Stripped pool
To use a whole unpartitioned disk to create a pool 
```bash
zpool create pool-name /dev/sdb
```
This will create the pool and mount it to `/pool-name`

You can add more than one disk drive, like `zpool create pool-name /dev/sdb /dev/sdc /dev/sdd etc...`. The capacity of all drives will be combined in one pool, as in a RAID0 pool.

### Mirrored pool
```bash
sudo zpool create pool-name mirror /dev/sdb /dev/sdc
```
This will create a mirrored -RAID1 style-  pool with the capacity of one disk and mount it to `/pool-name`

In both cases, the mount point can be specified with the `-m` option
```bash
zpool create -m /media/myzpool pool-name /dev/sdb 
```
`zpool status` and `zpool list` return information about the existing pools.

## ZFS Replication on different systems

https://klarasystems.com/articles/introduction-to-zfs-replication/

With two ZFS pools living on two different servers, we can take snapshots on one server and transfer them to the other.
 
The two systems must be able to passwordless SSH each other with the root account, so ssh keypairs must be configured beforehand.
 
To create a snapshot of the current status of the pool
```bash
zfs snapshot [pool-name]@[snapshot-name]
```
This will save the current status. You can check it with `zfs list -t snapshot`. It can be destroyed with `zfs destroy [pool-name]@[snapshot-name]`

The snapshot can be transferred to a different pool of the same system through piped commands
```bash
zfs send -v [pool-name]@[snapshot-name] | zfs receive [pool-name[/path]]
```
The same way, it can be trasferred via SSH
```bash
zfs send -v [pool-name]@[snapshot-name] | ssh [remotehost] zfs receive [pool-name[/path]]
```
