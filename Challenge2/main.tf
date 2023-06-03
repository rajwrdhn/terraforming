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

resource "aws_instance" "ec2" {
    ami = "ami-07151644aeb34558a"
    instance_type = "t2.micro"
    tags = {
      Name = var.ec2name
    }
    security_groups = [aws_security_group.sg-webserver.name]
    
}

resource "aws_security_group" "sg-webserver" {
    name = "Allow HTTP"
    
    ingress  {
        from_port = 80
        to_port = 80
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress  {
        from_port = 80 
        to_port = 80
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
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