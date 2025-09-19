output "ec2_instance_id" {
  value       = aws_instance.app.id
  description = "ID of the EC2 instance"
}

output "ec2_public_ip" {
  value       = aws_instance.app.public_ip
  description = "Public IP of the EC2 instance"
}

output "s3_bucket_name" {
  value       = aws_s3_bucket.app_bucket.*.id
  description = "S3 bucket name (if created)"
}
