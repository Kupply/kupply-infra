terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  backend "s3" {
    bucket         = var.backend_bucket_name
    key            = "terraform/terraform.tfstate" # path for tfstate file
    region         = var.aws_region
    dynamodb_table = var.backend_table_name
  }
}

provider "aws" {
  region = var.aws_region
}
