## Basic syntax
`.tf` files are organized in blocks, with the relevant parameters contained in brackets `{}`
```yml
terraform { #terraform settings
  required_providers {
}
provider "provider_name" {} #specific provider plugin config 
resource "resource_name" {} # components of the infrastructure
```
## Terraform Resources

* Official Documentation: https://developer.hashicorp.com/terraform/docs
* Internal Documentation: https://developer.hashicorp.com/terraform/internals
* OpenTofu: https://opentofu.org/docs/
* Terraform Provider Registry: https://registry.terraform.io/
