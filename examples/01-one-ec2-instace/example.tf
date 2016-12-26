provider "aws" {
  access_key = ""
  secret_key = ""
  region     = "eu-central-1"
}

resource "aws_instance" "example" {
  ami           = "ami-9346bcfc"
  instance_type = "t2.micro"
}
