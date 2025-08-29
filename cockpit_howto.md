## Overview

https://cockpit-project.org/

Cockpit is a web-based graphical interface for servers.

It can be accessed via https://hostname-or-ip-address:9090

## Redhat / Centos

Cockpit is preinstalled by default. it can be activated with the following command
```bash
systemctl enable --now cockpit.socket
```
## Debian / Ubuntu
Install via `apt-get`

## Plugins
Plugins are installed on `/usr/share/cockpit/`. Just unzip the extension file there and make the folder containing it is `0755` and owned by `root:root`  

 * NFS / Samba manager https://github.com/45Drives/cockpit-file-sharing
 * ZFS Manager https://github.com/45drives/cockpit-zfs-manager
 * Local file browser https://github.com/45Drives/cockpit-navigator