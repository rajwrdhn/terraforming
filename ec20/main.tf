terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "ec2" {
    ami = "ami-0ec7f9846da6b0f61"
    instance_type = "t2.micro"
    tags = {
      Name = var.ec2name
    }
    
}

resource "aws_eip" "elasticeip" {
  instance = aws_instance.ec2.id
}

variable "ec2name" {
  type = string
  description = "Set EC2 name:"
}

output "Elastic-EIP" {
  value = aws_eip.elasticeip.public_ip
}