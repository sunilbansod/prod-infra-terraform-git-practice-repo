terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # Backend configuration for state management in s3 bucket
  backend "s3" {
    bucket         = "sunil-git-my-terraform-state-bucket"
    key            = "prod-infra-terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
    #use_lockfile   = true
    #dynamodb_table = "terraform-lock-table"  # This DynamoDB table must exist in your AWS account
  }
}

provider "aws" {
  region = var.aws_region
}
