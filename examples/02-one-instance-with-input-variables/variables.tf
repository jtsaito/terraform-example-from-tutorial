# secrets are set in the local terraform.tfvars file

variable "access_key" {}
variable "secret_key" {}

variable "region" {
	default = "eu-central-1"
}
