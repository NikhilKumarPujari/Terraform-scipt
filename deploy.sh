#!/bin/bash

# 🚀 Terraform AWS Infrastructure Script
# Usage:
# ./deploy.sh <env> <resource> <action>
# Examples:
#   ./deploy.sh dev ec2 apply
#   ./deploy.sh dev ec2 destroy
#   ./deploy.sh dev all apply

ENV=$1
RESOURCE=$2
ACTION=$3
TFVARS_FILE="${ENV}.tfvars"

if [ -z "$ENV" ] || [ -z "$RESOURCE" ] || [ -z "$ACTION" ]; then
  echo "❌ Usage: ./deploy.sh <env> <resource> <apply|destroy>"
  echo "👉 Example: ./deploy.sh dev ec2 apply"
  exit 1
fi

if [ ! -f "$TFVARS_FILE" ]; then
  echo "❌ Variable file $TFVARS_FILE not found!"
  exit 1
fi

terraform init -upgrade

# Map resource to Terraform target
case $RESOURCE in
  ec2)
    TARGET="-target=aws_instance.ec2"
    ;;
  vpc)
    TARGET="-target=aws_vpc.main"
    ;;
  s3)
    TARGET="-target=aws_s3_bucket.bucket"
    ;;
  ebs)
    TARGET="-target=aws_ebs_volume.volume"
    ;;
  iam)
    TARGET="-target=aws_iam_user.user"
    ;;
  all)
    TARGET=""
    ;;
  *)
    echo "❌ Unknown resource: $RESOURCE"
    echo "👉 Options: ec2 | vpc | s3 | ebs | iam | all"
    exit 1
    ;;
esac

if [ "$ACTION" == "apply" ]; then
  echo "🚀 Applying $RESOURCE for $ENV..."
  terraform apply -var-file="$TFVARS_FILE" $TARGET -auto-approve
elif [ "$ACTION" == "destroy" ]; then
  echo "🔥 Destroying $RESOURCE for $ENV..."
  terraform destroy -var-file="$TFVARS_FILE" $TARGET -auto-approve
else
  echo "❌ Unknown action: $ACTION"
  echo "👉 Options: apply | destroy"
  exit 1
fi
