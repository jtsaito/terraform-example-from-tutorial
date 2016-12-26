## 03-ec2-and-sqs

Example Terraform configuration for an EC2 instance and an SQS queue.
The EC2 instance assumes a role by using a profile. The role allows the
instance to access the queue.

Note: (1) this example requires a key pair "aws-dev" for the EC2 instance;
(2) the AWS credentials in the `terraform.tfvars` need to be set before
applying this example.
