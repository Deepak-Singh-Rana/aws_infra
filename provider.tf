terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket         = "dsr-terraform-backend"
    key            = "nonprod/vpc_terraform.tfstate"
    region         = "ap-southeast-2"
    dynamodb_table = "terraform-state-lockig"
  }
}


provider "aws" {
  region = var.primary_region
}
