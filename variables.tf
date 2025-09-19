variable "region" {
  default = "ap-south-1"
}

variable "env" {
  description = "Environment name (dev, stage, prod)"
}

# EC2
variable "ami_id" {}
variable "instance_type" {
  default = "t2.micro"
}
variable "key_name" {}
variable "subnet_id" {}

# VPC
variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

# S3
variable "enable_s3" {
  default = false
}
variable "bucket_name" {
  default = ""
}

# EBS
variable "ebs_volume_size" {
  default = 8
}

# IAM
variable "iam_user" {
  default = "demo-user"
}
