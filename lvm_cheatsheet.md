# Create LVM volumes

`fdisk` to create the necessary partitions. At the fdisk prompt, `t` to set the partition type to LVM. ´w´ to write and quit.

Then create the Physical Volume
```
pvcreate /dev/sdb1
```
Create the Volume Group
```
vgcreate vgname /dev/sdb1 /dev/sdc1 etc...
```
Check it with `vgdisplay`
```
vgdisplay vgname
```
Create a new volume with the required size
```
lvcreate -n lvname --size 12G vgname

# Resize LVM volumes

