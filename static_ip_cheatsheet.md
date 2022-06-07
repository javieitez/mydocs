## Debian

```
vim /etc/network/interfaces
```
Also, look on `/etc/network/interfaces.d/*`

## Ubuntu

## Redhat/CentOS
```
vim /etc/sysconfig/network-scripts/ifcfg-<interface>
```
## Restart the network
```
ifdown <interface> && ifup <interface>
```
