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

resource "aws_db_instance" "myrds" {
  db_name = "myDB"
  identifier = "rds-1"
  instance_class = "db.t2.micro"
  engine = "mariadb"
  engine_version = "10.2"
  username = ""
  password = ""
  port = 3306
  allocated_storage = 20
  skip_final_snapshot = true
}