# this script is useful to create an instances inside a custom VPC

# AWS Provider Configuration
provider "aws" {
  region     = "us-east-2"  # Specifies the AWS region for resource deployment
  
}

# Resource block for a Virtual Private Cloud (VPC)
resource "aws_vpc" "assignment-4-vpc" {
  cidr_block = "10.0.0.0/16"  # Defines the IP address range for the VPC

  # Tags help in resource identification and management
  tags = {
    Name = "assignment-4-vpc"
  }
}

# Resource block for a subnet within the defined VPC
resource "aws_subnet" "assignment-4-subnet" {
  vpc_id            = aws_vpc.assignment-4-vpc.id  # Links the subnet to the VPC
  cidr_block        = "10.0.1.0/24"               # Defines the IP address range for the subnet
  availability_zone = "us-east-2a"                # Specifies the availability zone within the region

  # Tags for resource identification
  tags = {
    Name = "assignment-4-subnet"
  }
}

# Resource block for an EC2 instance
resource "aws_instance" "assignment-4" {
  ami           = "ami-0b8b44ec9a8f90422"         # AMI ID for the instance (to be filled)
  instance_type = "t2.micro"                      # Specifies the instance type
  subnet_id     = aws_subnet.assignment-4-subnet.id  # Associates the instance with a specific subnet
  key_name      = ""                               # Key pair for SSH access (to be filled)

  # Resource tagging
  tags = {
    Name = "assignment-4"
  }
}
