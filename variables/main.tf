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

variable "vpcname" {
    type = string
    default = "first_vpc"
}

variable "enabled" {
    default = true
}

variable "list1" {
  type = list(string)
  default = [ "value1", "value2" ]
}

variable "map1" {
  type = map
  default = {
    key1 = "value1"
    key2 = "value2"
  }
}

variable "mytuple" {
  type = tuple([ string, number,string ])
  default = [ "value", 0, "value2" ]
}

variable "myobject" {
  type = object({
    name = string
    port = number
  })
  default = {
    name = "raj"
    port = 80
  }
}

resource "aws_vpc" "vpcname" {
    cidr_block = "10.0.0.0/24"
    tags = {
        Name = var.inputname # can also put var.vpcname as a default name
    }
}

variable "inputname" {
  type = string
  description = "Set vpc name:"
}

output "myout" {
  value = aws_vpc.vpcname.id
}