## Basic syntax
`.tf` files are organized in blocks, with the relevant parameters contained in brackets `{}`
```yml
terraform { #terraform settings
  required_providers {
}
provider "provider_name" {} #specific provider plugin config 
resource "resource_type" "resource_name" {} # components of the infrastructure
```
## Commands
* `terraform init` initializes the project
* `terraform fmt` returns a list of the files modified by terraform
* `terraform validate` checks the syntax
* `terraform plan` validates the project and resources
* `terraform apply` applies the configuration and deploys the infrastructure
* `terraform show` allows you to inspect the current infrastructure
* `terraform destroy` deletes all the infrastucture

## Terraform Resources

* Official Documentation: https://developer.hashicorp.com/terraform/docs
* Internal Documentation: https://developer.hashicorp.com/terraform/internals
* OpenTofu: https://opentofu.org/docs/
* Terraform Provider Registry: https://registry.terraform.io/
