resource "aws_iam_user" "streammanager" {
  name = "streammanager"
}

resource "aws_iam_access_key" "streammanager" {
  user = "${aws_iam_user.streammanager.name}"
}

resource "aws_iam_user_policy" "lb_ro" {
  name = "test"
  user = "${aws_iam_user.streammanager.name}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:Describe*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}