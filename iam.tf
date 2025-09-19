resource "aws_iam_user" "user" {
  name = "${var.env}-${var.iam_user}"
}

resource "aws_iam_access_key" "user_key" {
  user = aws_iam_user.user.name
}
