# Set static IP

### Ubuntu

If the file doesn't exist, `netplan generate`, then `vim /etc/netplan/00-installer-config.yaml`

``` shell
# This is the network config written by 'subiquity'
network:
  ethernets:
    ens33:
      dhcp4: false
      addresses: [10.101.xxx.xxx/28]
      gateway4: 10.101.xx.xx
      nameservers:
              addresses: [8.8.4.4,8.8.8.8]
```

then, apply the changes with `netplan apply`

### Debian
```bash
vim /etc/network/interfaces
```
Also, look on `/etc/network/interfaces.d/*`

### Redhat 7/8
```bash
vim /etc/sysconfig/network-scripts/ifcfg-<interface>
```

### Redhat 9
```bash
vim /etc/NetworkManager/system-connections/ens192.nmconnection
```
or
```bash
nmcli con add type ethernet con-name static1 ifname <INTERFACE> ip4 x.x.x.x/xx gw4 x.x.x.x ipv4.dns "8.8.8.8 8.8.4.4"
```
# Restart the network
Ubuntu, Debian, Redhat 8 and below
```bash
ifdown <interface> && ifup <interface>
```
Redhat 9 and above
```bash
nmcli connection load /etc/NetworkManager/system-connections/ens192.nmconnection
```
Differences on Redhat 9 https://www.redhat.com/en/blog/rhel-9-networking-say-goodbye-ifcfg-files-and-hello-keyfiles
