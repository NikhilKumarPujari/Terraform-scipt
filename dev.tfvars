env           = "dev"
region        = "ap-south-1"

ami_id        = "ami-08e5424edfe926b43"
instance_type = "t3.micro"
key_name      = "dev-key"
subnet_id     = "subnet-xxxxxxx"

vpc_cidr      = "10.0.0.0/16"

enable_s3     = true
bucket_name   = "dev-demo-bucket"

ebs_volume_size = 10 // sample

iam_user = "dev-user"
