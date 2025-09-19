# 🚀 Terraform AWS Infrastructure

This project provisions AWS resources (EC2, S3, VPC) using **Terraform**.  
It supports **multiple environments** (`dev`, `stage`, `prod`) with separate variable files.

```bash
examples to run only     
ec2 ->  ./deploy.sh dev ec2 apply/destroy
vpc ->   ./deploy.sh dev vpc apply/

for resources to run ->  ./deploy.sh dev all
for destroy all ->  ./deploy.sh prod all destroy



## 📂 Project Structure
---
terraform-aws/
│── main.tf              # Root Terraform config
│── providers.tf         # AWS provider
│── variables.tf         # Global variables
│── outputs.tf           # Common outputs
│
├── ec2.tf               # EC2 resources
├── s3.tf                # S3 resources
├── vpc.tf               # VPC resources
│
├── dev.tfvars           # Dev environment
├── stage.tfvars         # Stage environment
└── prod.tfvars          # Prod environment

example:
env           = "dev"
ami_id        = "ami-08e5424edfe926b43"
instance_type = "t2.micro"
key_name      = "dev-key"
vpc_cidr      = "10.0.0.0/16"
enable_s3     = true

terraform init
terraform plan -var-file="dev.tfvars"
terraform apply -var-file="dev.tfvars" -auto-approve
terraform destroy -var-file="dev.tfvars" -auto-approve




```
