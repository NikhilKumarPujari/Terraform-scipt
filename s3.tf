resource "aws_s3_bucket" "bucket" {
  count = var.enable_s3 ? 1 : 0
  bucket = "${var.env}-${var.bucket_name}"

  tags = {
    Name = "${var.env}-bucket"
  }
}
