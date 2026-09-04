terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}
# terraform {
#   backend "s3" {
#     bucket = "statefile-module2-2026-09-22"
#     key = "module2/tfstatefile.tfstate"
#     region = "ap-south-1"
#     use_lockfile = true
#     encrypt = true
#   }
# }

# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
}
