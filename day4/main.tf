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


# Create Security Group
resource "aws_security_group" "allow_tls" {
  name        = "allow tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = var.vpc_id

  tags = {
    Name = "Allow TLS Security Group"
  }
}


# Ingress Rule to allow TLS traffic from specified CIDR blocks
resource "aws_vpc_security_group_ingress_rule", "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_viv4         = var.allowed_cidr_blocks
  from_port        = 443
  to_port          = 443
  protocol         = "tcp"
}
