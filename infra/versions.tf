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
    key    = "terraform/state"
    region = "eu-central-1"
    profile = "techstarter"
  }
}

provider "aws" {
  region  = var.region
  profile = var.aws_profile
}
