# This script will create EC2 instances in two different regions 

# Provider configuration for AWS in the Northern Virginia region (us-east-1)
provider "aws" {
  alias      = "NV"             # Alias to refer to this specific provider instance
  region     = "us-east-1"      # AWS region
}

# Provider configuration for AWS in the Ohio region (us-east-2)
provider "aws" {
  alias      = "Ohio"           # Alias to refer to this specific provider instance
  region     = "us-east-2"      # AWS region
  
}

# EC2 instance in Northern Virginia
resource "aws_instance" "assignment-3-1" {
  provider        = aws.NV        # Specifies which provider to use for this resource
  ami             = "ami-080e1f13689e07408"            # AMI ID for the instance
  instance_type   = "t2.micro"    # Type of instance

  # Tags to identify the instance
  tags = {
    Name = "hello-virginia"
  }
}

# EC2 instance in Ohio
resource "aws_instance" "assignment-3-2" {
  provider        = aws.Ohio      # Specifies which provider to use for this resource
  ami             = "ami-0b8b44ec9a8f90422"    # AMI ID for the instance
  instance_type   = "t2.micro"    # Type of instance
  key_name        = ""            # Key pair name for SSH access

  # Tags to identify the instance
  tags = {
    Name = "hello-ohio"
  }
}
