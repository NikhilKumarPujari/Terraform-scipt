resource "aws_ebs_volume" "volume" {
  availability_zone = "${var.region}a"
  size              = var.ebs_volume_size

  tags = {
    Name = "${var.env}-ebs"
  }
}
