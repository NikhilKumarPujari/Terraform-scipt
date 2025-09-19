# 🚀 Terraform AWS Infrastructure

This project provisions AWS resources (EC2, S3, VPC) using **Terraform**.  
It supports **multiple environments** (`dev`, `stage`, `prod`) with separate variable files.

---

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


env           = "dev"
ami_id        = "ami-08e5424edfe926b43"
instance_type = "t2.micro"
key_name      = "dev-key"
vpc_cidr      = "10.0.0.0/16"
enable_s3     = true

---
