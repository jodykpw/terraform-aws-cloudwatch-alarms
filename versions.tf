# Terraform Block
terraform {
  required_version = ">= 0.14"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
    null = {
      source = "hashicorp/null"
      version = "~> 3.0"
    }   
    random = {
      source = "hashicorp/random"
      version = "~> 3.0"
    }   
  }
}

# Provider Block
provider "aws" {
  profile   = var.aws_profile
  region    = var.aws_region
}
/*
Note-1:  AWS Credentials Profile (profile = "default") configured on your local desktop terminal  
$HOME/.aws/credentials
*/

# Create Random Pet Resource
resource "random_pet" "this" {
  length = 2
}