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
    Name = var.myobject.name
  }
}

variable "vpcname" {
  type = string
  default = "raj"
}

variable "sshport" {
  type = number
  default = 22
}

variable "enabled" {
  default = true
}

variable "disabled" {
  default = false
}

variable "mylist" {
  type = list(string)
  default = [ "value1", "value2" ]
}

variable "mymap" {
  type = map 
  default = {
    Key1 = "value1"
    Key2 = "value2"
  }
}

variable "mytuple" {
  type = tuple([ string, number, string ])
  default = [ "cat", 0, "dog" ]
}

variable "myobject" {
    type = object({
      name = string,
      port = list(number)
    })
  default = {
    name = "rajobj"
    port = [ 22,24,80 ]
  }
}


variable "inputnamevpc" {
  type = string
  description = "set the vpc name : "
}

output "rajsvpc" {
  value = aws_vpc.raj_vpc.id
}

variable "environment" {
  type = string
}

resource "aws_instance" "ec2" {
  ami = ""
  instance_type = "t2.micro"
  count = var.environment == "prod" ? 1 : 0
}