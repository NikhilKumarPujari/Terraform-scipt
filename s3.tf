resource "aws_s3_bucket" "app_bucket" {
  count  = var.enable_s3 ? 1 : 0
  bucket = "${var.env}-app-bucket-123456"
  acl    = "private"

  tags = {
    Name = "${var.env}-bucket"
    Env  = var.env
  }
}
