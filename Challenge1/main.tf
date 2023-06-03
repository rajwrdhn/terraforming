#plugins
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
resource "aws_vpc" "TerraformVPC" {
  cidr_block = "198.162.0.0/24"
  tags = {
    Name = var.inputvpcname # could also have var.vpcname and set to rajsvpc name
  }
}

variable "vpcname" {
  type = string
  default = "rajsvpc"
}

variable "inputvpcname" {
  type = string
  description = "enter vpc name:"
}

output "outvpc" {
  value = aws_vpc.TerraformVPC.id
}

