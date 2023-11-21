terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "tfstate-bucket-k1m0"
    key    = "terraform/terraform.tfstate"
    region = "eu-central-1"
  }
}

provider "aws" {
  region  = var.region
  profile = var.aws_profile
}
