Create a dummy file, e.g. `test.tf` , containing a dummy resource block 

```tf
resource "proxmox_vm_qemu" 
"import_test" { }
```
Run the `terraform import` command
```shell
terraform import proxmox_vm_qemu.import_test mynode/qemu/101
```
The state gets imported to `terraform.tfstate` , you can open that file and explore the imported state as Terraform config code

### More information
https://registry.terraform.io/providers/Telmate/proxmox/latest/docs/resources/vm_qemu
