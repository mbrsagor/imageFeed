# Project Configuration
project_name = "aws-terraform-course"
environment  = "demo"
region       = "us-east-1"

# Network Configuration
vpc_cidr          = "10.0.0.0/16"
availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]

# Tags
tags = {
  Owner       = "DevOps-Team"
  Department  = "Engineering"
  CostCenter  = "Engineering-001"
  Project     = "TerraformLearning"
}
