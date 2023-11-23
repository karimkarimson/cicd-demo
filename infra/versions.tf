terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "tf-backend-bucket-k1m0"
    key            = "terraform/terraform.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "tf-backend-lock-k1m0-testtable"
  }
}

provider "aws" {
  region  = var.region
  profile = var.aws_profile
}
