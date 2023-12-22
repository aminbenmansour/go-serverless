terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }

    archive = {
      source  = "hashicorp/archive"
      version = "2.4.1"
    }
  }
}

# Configure the AWS Provider
# Using credentials from shared credentials file (default is $HOME/.aws/credentials) or environment variables
provider "aws" {
  region = var.aws_region
}

provider "archive" {}