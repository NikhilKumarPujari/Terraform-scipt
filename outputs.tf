# EC2 Outputs
output "ec2_instance_id" {
  value       = aws_instance.ec2.id
  description = "The ID of the EC2 instance"
}

output "ec2_public_ip" {
  value       = aws_instance.ec2.public_ip
  description = "The Public IP of the EC2 instance"
}

# VPC Outputs
output "vpc_id" {
  value       = aws_vpc.main.id
  description = "The ID of the VPC"
}

# S3 Outputs
output "s3_bucket_name" {
  value       = aws_s3_bucket.bucket[0].bucket
  description = "The name of the S3 bucket"
  condition   = length(aws_s3_bucket.bucket) > 0
}

# EBS Outputs
output "ebs_volume_id" {
  value       = aws_ebs_volume.volume.id
  description = "The ID of the EBS volume"
}

# IAM Outputs
output "iam_user_name" {
  value       = aws_iam_user.user.name
  description = "The IAM user name"
}
