resource "aws_iam_user" "streammanager" {
  name = "${var.cluster_name}-streammanager"
}

resource "aws_iam_access_key" "streammanager" {
  user = "${aws_iam_user.streammanager.name}"
}

data "aws_iam_policy" "streammanager" {
  arn = "arn:aws:iam::aws:policy/EC2FullAccess"
}

resource "aws_iam_user_policy_attachment" "streammanager" {
  user       = "${aws_iam_user.streammanager.name}"
  policy_arn = "${data.aws_iam_policy.streammanager.arn}"
}
