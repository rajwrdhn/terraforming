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

resource "aws_instance" "myec2" {
  ami = "ami-07151644aeb34558a"
  instance_type = "t2.micro"
  tags = {
    Name = var.ec2name
  }
}

resource "aws_eip" "elasticeip" {
  instance = aws_instance.myec2.id
}

variable "ec2name" {
    type = string
    default = "rajsec2"
}

output "myout" {
  value = aws_eip.elasticeip.id
}