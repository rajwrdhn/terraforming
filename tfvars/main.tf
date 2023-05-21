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

# declaring input variable environment
variable "environment" {
  type = string
}

# create ec2 instance on prod
resource "aws_instance" "ec2" {
  ami = "ami-04e601abe3e1a910f"
  instance_type = "t2.micro"
  count = var.environment == "prod" ? 1 : 0
}