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

resource "aws_vpc" "vpcname" {
    cidr_block = "10.0.0.0/18"
    tags = {
      Name = var.vpcname
    }
}

variable "vpcname" {
  type = string
  default = "myvpc"  
}

#export AWS_ACCESS_KEY_ID = 
#export AWS_SECRET_KEY_ID = 
