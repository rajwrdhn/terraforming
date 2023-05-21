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

module "ec2module" {
  source = "./modules"
  ec2name1 = "name1"
  ec2name2 = "name2"
}

output "module_output" {
  value = module.ec2module.instance_id1
}

output "module_output2" {
  value = module.ec2module.instance_id2
}