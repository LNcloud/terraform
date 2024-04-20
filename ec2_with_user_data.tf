# this script is useful launch an ec2 instance with custom user data

# AWS Provider Configuration
provider "aws" {
  region     = "us-east-2"  # AWS region where resources will be deployed
  
}

# Resource block for an AWS EC2 instance
resource "aws_instance" "a5-instance" {
  ami           = "ami-0b8b44ec9a8f90422"  # AMI ID for the instance (fill with actual AMI ID)
  instance_type = "t2.micro"  # Instance type to be deployed
  key_name      = ""  # SSH key name for instance access (fill with actual key name)

  # User data to run at instance initialization; uses a local script file
  user_data = file("${path.module}/install-apache2.sh")  # Corrected to properly load the script

  # Tags for resource identification and management
  tags = {
    Name = "a5-instance"
  }
}

# Output block to retrieve and display the public IP of the created EC2 instance
output "IPv4" {
  value       = aws_instance.a5-instance.public_ip
  description = "The public IP address of the EC2 instance."
}
