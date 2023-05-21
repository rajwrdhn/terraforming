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

resource "aws_vpc" "raj_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "raj"
  }
}

output "vpc_id" {
  value = aws_vpc.raj_vpc.id
}
