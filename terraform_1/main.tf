# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  access_key = "AKIAQGM7FW2VOMZALHPV"
  secret_key = "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"
}
# aws subnet block
resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Main"
  }
}

# Create a VPC
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}
# Create the Security Group
resource "aws_security_group" "main" {
  vpc_id = aws_vpc.main.id
  name   = "main Security Group"

  # allow ingress of port 22
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }

  # allow egress of all ports
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "main-SG"
  }
}
