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

    tags = {
      Name = var.undeclare
    }
}

variable "undeclared" {
  
}