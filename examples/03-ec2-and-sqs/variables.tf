# secrets are set in the local terraform.tfvars file
variable "access_key" {}
variable "secret_key" {}

variable "region" {
	default = "eu-central-1"
}


output "messages_arn" {
	value = "${aws_sqs_queue.messages.arn}"
}

output "messages_url" {
	value = "${aws_sqs_queue.messages.url}"
}
