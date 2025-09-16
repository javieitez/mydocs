## Create an API user for Terraform

* Go to **Datacenter** in the left tab
* navigate to **Permissions > Users** and add a new user with authentication in the PVE realm. 
* Under **API tokens**, create a new token associated with the user. Save this key, it won’t be displayed again.

## Add the Proxmox provider

* On an empty folder, create a blank file named `main.tf`
* Go to [Telmate/proxmox](https://registry.terraform.io/providers/Telmate/proxmox/latest) and click on the **USE PROVIDER** button. Copy the block of text and paste it in the `main.tf` file.

The whole file should look like this

```tf
terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
      version = "3.0.2-rc04"
    }
  }
}
provider "proxmox" {
 pm_api_url = "https://MY_PROXMOX_IP:8006/api2/json"
 pm_tls_insecure = true # By default Proxmox uses self-signed certificates
 pm_api_token_id = "MY_USERNAME@pve!MY_API_TOKEN"
 pm_api_token_secret = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
}

resource "proxmox_vm_qemu" "my_test_vm" {
 name       = "my-vm"
 target_node = "MY_NODE"
 clone      = "MY_TEMPLATE"
 cpu { cores = 2 }
 memory     = 1024
}
```
Run `terraform init`,`terraform plan` and `terraform apply`.

Run `terraform destroy` to destroy the test VM.
