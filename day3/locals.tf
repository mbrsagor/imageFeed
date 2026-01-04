locals {
  # Common tags applied to all resources
  common_tags = merge(var.tags, {
    Environment   = var.environment
    Project       = var.project_name
    ManagedBy     = "Terraform"
    CreatedDate   = formatdate("YYYY-MM-DD", timestamp())
  })

  # Naming convention
  name_prefix = "${var.project_name}-${var.environment}"
  
  # Network configuration
  vpc_name = "${local.name_prefix}-vpc"
  
  # Storage configuration  
  bucket_name = "${local.name_prefix}-${random_id.bucket_suffix.hex}"
}

# Random suffix for globally unique names
resource "random_id" "bucket_suffix" {
  byte_length = 4
  
  keepers = {
    project     = var.project_name
    environment = var.environment
  }
}