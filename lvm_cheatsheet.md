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
Once it's mounted, just copy the line from `/etc/mtab`

# Resize LVM volumes

Resizing goes in 3 steps, not counting the extra disk space creation on the VM

First, extend the partition containing the LVM with parted
```
parted /dev/sdX
```
at the parted prompt, locate the number of the partition you want to resize
```
resizepart (number)
```
After that, tell LVM the new space is available
```
lvextend -l +100%FREE /dev/mapper/(partition)
```
Finally, resize the file system
```
resize2fs /dev/vgname/lvname/

