provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

resource "aws_instance" "example" {
  ami = "ami-9346bcfc"
  instance_type = "t2.micro"
  iam_instance_profile = "sqs_queue_messages_full_access_profile"
  key_name = "aws-dev"   		   # a key-pair with this name is required to exist!
}

resource "aws_sqs_queue" "messages" {
  name = "terraform-example-messages"
  delay_seconds = 10
  max_message_size = 2048
  message_retention_seconds = 86400
  receive_wait_time_seconds = 10
}
