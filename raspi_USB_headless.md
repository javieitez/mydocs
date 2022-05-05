# Headless SSH server from an old Raspberry Pi model B

Install the Raspberry Pi imager
https://www.pragmaticlinux.com/2021/08/install-the-raspberry-pi-imager-on-ubuntu-debian-fedora-and-opensuse/

Burn the same OS to both an SD card and a USB drive, with the same options (create user, enable SSH, etc...). 

On the boot partition of the USB drive, open  `cmdline.txt` and find a string similar to 
```
root=PARTUUID=14558a46-02
```
Write down the number. Now backup the same file in the boot partition of the SD card, open it and replace the PARTUUID with the one of the USB drive.

## Optional: add a static IP

Edit `/etc/dhcpcd.conf` and add your IP settings
```
# define static profile
#profile static_eth0
static ip_address=192.168.1.5/24
static routers=192.168.1.1
static domain_name_servers=8.8.8.8
```
## Check if the OS is effectively running from USB  

Easy: You can create a text file somewhere in both USB and SD (like `~/this_is_SD` and `~/this_is_USB`) and check it after boot.    

Also easy: after booting, run `lsblk`
```
NAME        MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda           8:0    1  7.5G  0 disk
├─sda1        8:1    1  256M  0 part /boot
└─sda2        8:2    1  7.2G  0 part /
mmcblk0     179:0    0 29.3G  0 disk
├─mmcblk0p1 179:1    0  256M  0 part
└─mmcblk0p2 179:2    0   29G  0 part
```
SD cards are listed as `mmcblkX` while USB drives are traditional `sdX`

# Recovery and troubleshooting

## disabled SSH server  
If the SSH server is disabled for any reason, create a blank file named `ssh` on the boot partition of the SD card. This enables the SSH service on the first boot, but maybe a second reboot is required to actually start it.

## Boot from SD and Chroot the USB environment

Restore the /boot/cmdline.txt file from backup and boot from SD.

Once booted, mount the USB partition to `/mnt`
```
mount /dev/sda2 /mnt
```
Then mount the necessary folders
```
mount /dev/sda1 /mnt/boot
mount -t proc proc /mnt/proc
mount -t sysfs sys /mnt/sys
mount -o bind /dev /mnt/dev
```
Finally, move into the mounted filesystem:
```
chroot /mnt /bin/bash
```
