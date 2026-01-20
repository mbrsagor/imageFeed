# Variables for AWS deployment region
variable "region" {
  description = "AWS region to deploy resources into"
  type        = string
  default     = "us-east-1"
}

# New variable to specify the number of instances to create
variable "instance_count" {
  description = "Number of EC2 instances to create"
  type        = number
}

# New variable to specify the environment (e.g., dev, prod, preprod)
variable "monitoring_enabled" {
  description = "Enable monitoring for EC2 instances"
  type        = bool
  default     = true
}

# Associate public IP address variable
variable "associate_public_ip" {
  description = "Whether to associate a public IP address with the instance"
  type        = bool
  default     = true
}
