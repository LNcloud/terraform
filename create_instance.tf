//This script is useful for creating an EC2 instance in the default VPC


// Provider configuration for AWS
provider "aws" {
  region     = "us-east-2" // Specify the AWS region
  
}

# Resource configuration for an EC2 instance
resource "aws_instance"  {
  ami           = "ami-0b8b44ec9a8f90422"            // AMI ID for the instance
  instance_type = "t2.micro"    // Type of instance
  key_name      = ""            // Key pair name (to be filled)

  # Tags to identify resources
  tags = {
    Name = "demo-1"
  }
}
