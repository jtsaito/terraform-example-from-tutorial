# iam setup for EC2 instance.
# allows instance to read/write from sqs queue
# with temporary credentials for assumed role.


resource "aws_iam_role_policy" "sqs_queue_messages_full_access_policy" {
    name = "sqs_queue_messages_full_access_policy"
    role = "${aws_iam_role.sqs_queue_messages_full_access_role.id}"
    policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "sqs:*"
      ],
      "Effect": "Allow",
      "Resource": "${aws_sqs_queue.messages.arn}"
    }
  ]
}

EOF
}


resource "aws_iam_role" "sqs_queue_messages_full_access_role" {
    name = "sqs_queue_messages_full_access_role"
    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}


resource "aws_iam_instance_profile" "sqs_queue_messages_full_access_profile" {
    name = "sqs_queue_messages_full_access_profile"
    roles = ["${aws_iam_role.sqs_queue_messages_full_access_role.name}"]
}
