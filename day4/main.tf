# Create instance

resource "aws_instance" "example" {
  count         = 1
  ami           = "ami-0c55b159cbfafe1f0" # Example AMI ID, replace with a valid one for your region
  instance_type = "t3.micro"
  region        = var.region

  tags = {
    Name = "ExampleInstance"
  }
}
