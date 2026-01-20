# Create instance

resource "aws_instance" "example" {
  count         = var.instance_count
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t3.micro"
  region        = var.region
  monitoring    = var.monitoring_enabled
  associate_public_ip_address = var.associate_public_ip

  tags = {
    Environment = var.environment
    Name        = "${var.environment}-EC2-Instance"
  }
}
