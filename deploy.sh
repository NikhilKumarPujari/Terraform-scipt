#!/bin/bash

# Usage:
# ./deploy.sh dev ec2
# ./deploy.sh dev all

ENV=$1
RESOURCE=$2
TFVARS_FILE="${ENV}.tfvars"

if [ -z "$ENV" ]; then
  echo "❌ Usage: ./deploy.sh <env> [resource]"
  echo "👉 Example: ./deploy.sh dev ec2"
  exit 1
fi

terraform init -upgrade

if [ "$RESOURCE" == "ec2" ]; then
  terraform apply -var-file="$TFVARS_FILE" -target=aws_instance.ec2 -auto-approve
elif [ "$RESOURCE" == "vpc" ]; then
  terraform apply -var-file="$TFVARS_FILE" -target=aws_vpc.main -auto-approve
elif [ "$RESOURCE" == "s3" ]; then
  terraform apply -var-file="$TFVARS_FILE" -target=aws_s3_bucket.bucket -auto-approve
elif [ "$RESOURCE" == "ebs" ]; then
  terraform apply -var-file="$TFVARS_FILE" -target=aws_ebs_volume.volume -auto-approve
elif [ "$RESOURCE" == "iam" ]; then
  terraform apply -var-file="$TFVARS_FILE" -target=aws_iam_user.user -auto-approve
else
  terraform apply -var-file="$TFVARS_FILE" -auto-approve
fi
