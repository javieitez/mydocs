## Prepare the template
Download the Cloud-Init image from the Debian Repo
```shell
wget https://cloud.debian.org/images/cloud/trixie/latest/debian-13-genericcloud-amd64.qcow2
```
Create an empty VM 
```shell
qm create 999 --name debian13-cloudinit
```
import the qcow imag into it
```shell
qm set 999 --scsi0 local-lvm:0,import-from=/root/debian-13-genericcloud-amd64.qcow2
```
and convert it to a template
```
qm template 999
```
## Create a Snippet
Create the following file in `/var/lib/vz/snippets/qemu-guest-agent.yml`
```shell
#cloud-config
runcmd:
  - apt update
  - apt install -y qemu-guest-agent
  - systemctl start qemu-guest-agent
```
