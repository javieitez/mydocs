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
## Terraform Configuration

```tf
resource "proxmox_vm_qemu" "cloudinit-example" {
  #vmid        = 101 # comment to pick the next available ID 
  name        = "test-terraform0"
  target_node = "mypve"
  agent       = 1
  cores       = 2
  memory      = 1024
  boot        = "order=scsi0" # has to be the same as the OS disk of the template
  clone       = "debian13-cloudinit" # The name of the template
  scsihw      = "virtio-scsi-single"
  vm_state    = "running"
  automatic_reboot = true

  # Cloud-Init configuration
  cicustom   = "vendor=local:snippets/qemu-guest-agent.yml" # /var/lib/vz/snippets/qemu-guest-agent.yml
  ciupgrade  = true
  nameserver = "1.1.1.1 8.8.8.8"
  ipconfig0  = "ip=192.168.1.11/24,gw=192.168.1.1,ip6=dhcp"
  skip_ipv6  = true
  ciuser     = "root"
  cipassword = "Enter123!"
  sshkeys    = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIE/Pjg7YXZ8Yau9heCc4YWxFlzhThnI+IhUx2hLJRxYE Cloud-Init@Terraform"

  # Most cloud-init images require a serial device for their display
  serial {
    id = 0
  }

  disks {
    scsi {
      scsi0 {
        # The disk from our template
        disk {
          storage = "local-lvm"
          # The size of the disk should be at least as big as the disk in the template. If it's smaller, the disk will be recreated
          size    = "3G" 
        }
      }
    }
    ide {
      # Some images require a cloud-init disk on the IDE controller
      ide1 {
        cloudinit {
          storage = "local-lvm"
        }
      }
    }
  }

  network {
    id = 0
    bridge = "vmbr0"
    model  = "virtio"
  }
}

terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
      version = ">=3.0.1-rc4"
    }
  }
}
```
