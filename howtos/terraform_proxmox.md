# Create an API user for Terraform

* Go to **Datacenter** in the left tab
* navigate to **Permissions > Users** and click **Add**
* Under **API tokens**, create a new token associated with the user. Save this key, it won’t be displayed again.
# Add the Proxmox provider
* On an empty folder, create a blank file named `main.tf`
* Go to https://registry.terraform.io/providers/bpg/proxmox/latest and click on the **USE PROVIDER** button. Copy the block of text and paste it in the `main.tf` file.

```tf
terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
      version = "0.83.2"
    }
  }
}

provider "proxmox" {
  # Configuration options
}
```
