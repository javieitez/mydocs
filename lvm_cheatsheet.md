# Create LVM volumes

`fdisk` to create the necessary partitions. At the fdisk prompt, `t` to set the partition type to LVM. `w` to write and quit.

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
```
Check it with `lvdisplay`
```
lvdisplay vgname
```
Write down the LV path and format it 
```
mkfs.ext4 /dev/vgname/lvname/
```
Finally, mount the file system
```
mount /dev/vgname/lvname/ /media/lvname
```
# Add to /etc/fstab


# Resize LVM volumes

