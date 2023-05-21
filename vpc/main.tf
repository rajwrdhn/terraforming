terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-central-1"
}

# Create a VPC
resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/18"
  tags = {
    Name = var.vpcname
  }
}

variable "vpcname" {
  type = string
  description = "Set VPC name :"
}

output "vpcidout" {
  value = aws_vpc.example
}
