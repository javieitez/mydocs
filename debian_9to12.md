# Debian Upgrades

### Upgrade Debian 9 to 10

```bash
apt update -y &&  apt upgrade -y
```
Change `/etc/apt/sources.list`
```
deb http://deb.debian.org/debian/ buster main
deb http://deb.debian.org/debian/ buster-updates main
deb http://security.debian.org/debian-security buster/updates main
```
```
apt update -y && apt upgrade -y &&  apt dist-upgrade -y
```
Reboot

### Upgrade Debian 10 to 11
Same as above, but with repos
```
deb http://deb.debian.org/debian/ bullseye main
deb http://deb.debian.org/debian/ bullseye-updates main
```
### Upgrade Debian 11 to 12
Same as above, but with repos
```
deb http://deb.debian.org/debian/ bookworm main
deb http://deb.debian.org/debian/ bookworm-updates main
```

After finishing all upgrades, run `apt autoremove -y`
