# Move /boot partition

Shutdown the VM and extend the disk. Add 1 or 2 additional GB.

Boot the VM and login as root or sudoer. 

## fdisk
* `fdisk /dev/sda` and create a new partition on the free space. 
* press `a` to toggle the bootable flag on the new partition and remove it on the old one
* exit fdisk and `mkfs` the partition with the same format of the exisitng one

## Copy files

* mount the new partition to `/mnt` 
* `cp -pR /boot/* /mnt/` 

## /etc/fstab

* Use `blkid` to get the UUID of the new partition
* Add the entry to /etc/fstab and comment the old one

# Reboot

## Apply grub changes
Optional: rebuild the config
```
sudo grub-mkconfig
```
Reinstall the bootloader
```
sudo grub-install /dev/sda
```
Note that on Redhat based systems the commands can be `grub2-whatever`

Finally, `sudo update-grub` and reboot again.

The old partition can be recycled for swap...
