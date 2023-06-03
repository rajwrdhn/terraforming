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

module "ec2module2" {
  source = "./ec2"
  ec2name = "Name from module2"
}

module "ec2module1" {
  source = "./ec1"
  ec2name = "Name from module1"
}

output "module_output1" {
  value = module.ec2module1.instance_id
}
output "module_output" {
  value = module.ec2module2.instance_id
}