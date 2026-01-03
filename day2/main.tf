# Configure the AWS Provider
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS region
provider "aws" {
  region = "us-east-1"
}


# Create S3 bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = "mbrsagor-123456"
  acl    = "private"
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

