# This script is useful for creating an EC2 instance with an elastic IP assigned to it

# Provider configuration for AWS
provider "aws" {
  region     = "us-east-2"  # AWS region where resources will be created
}

# Define an AWS EC2 instance
resource "aws_instance" "assignment-2" {
  ami           = "ami-0b8b44ec9a8f90422"         # AMI ID for the instance
  instance_type = "t2.micro" # The type of instance
  key_name      = ""         # Key pair name for SSH access

  # Tags to identify the instance
  tags = {
    Name = "assignment-2"
  }
}

# Allocate an Elastic IP within a VPC
resource "aws_eip" "eip" {
  domain="vpc"  # Specify that the EIP is for use within a VPC
}

# Associate the Elastic IP with the EC2 instance
resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.assignment-2.id   # Reference to the instance's ID
  allocation_id = aws_eip.eip.allocation_id      # Reference to the Elastic IP's ID
}
