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

Resizing goes in 4 steps, not counting the extra disk space creation on the VM

First, extend the partition containing the LVM with parted
```
parted /dev/sdX
```
at the parted prompt, locate the number of the partition you want to resize
```
resizepart (number)
```
You can enter `100%` to use all unallocated space

After that, tell LVM the new space is available
```
pvresize /dev/sdX
```
Extend the partition
```
lvextend -l +100%FREE /dev/mapper/(partition)
```
Finally, resize the file system
if ext4
```
resize2fs /dev/vgname/lvname/
```
if xfs
```
xfs_growfs /dev/vgname/lvname/
```
## Read more
* https://carleton.ca/scs/2019/extend-lvm-disk-space/
* https://www.redhat.com/sysadmin/resize-lvm-simple
