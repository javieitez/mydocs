## Basic syntax
`.tf` files are organized in blocks, with the relevant parameters contained in brackets `{}`
```yml
terraform { #terraform settings
  required_providers {
}
provider "provider_name" {} #specific provider plugin config 
resource "resource_type" "resource_name" {} # components of the infrastructure
```
Terraform parses al the `.tf` files in the current directory, so it can be organized in files like `main.tf`, `vars.tf`, etc..

## Variables
Variables are declared in their own block
```tf
variable "VM_name" {
  description = "Some text here"
  type        = string
  default     = "MY_VM_NAME"
}
```
They can be invoked in any other `.tf` with `var.variable_name` (without quotes) or via command line
```
terraform apply -var "VM_name=YetAnotherName"
```
Variables declared in the command line take precedence

## Key Concepts
`state` are the components and resources of the running infrastructure: VMs, containers, networks, etc...

## Commands
### Preparation
These commands are usually executed before deploying the infrastructure
* `terraform init` initializes the project
* `terraform fmt` returns a list of the files modified by terraform
* `terraform validate` checks the syntax
* `terraform plan` validates the project and resources
* `terraform apply` applies the configuration and deploys the infrastructure
## Run time
These commands are executed while the infrastructure is up and running
* `terraform show` allows you to inspect the current infrastructure
* `terraform state list` lists the current resources
* `terraform destroy` deletes all the infrastucture

If changes are made to the infrastructure, you can run `terraform apply` again to review and apply them.

## Terraform Resources

* Official Documentation: https://developer.hashicorp.com/terraform/docs
* Internal Documentation: https://developer.hashicorp.com/terraform/internals
* OpenTofu: https://opentofu.org/docs/
* Terraform Provider Registry: https://registry.terraform.io/
