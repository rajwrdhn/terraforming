variable "ec2name2" {
  type = string
}

resource "aws_instance" "ec2-2" {
    ami = "ami-0b7fd829e7758b06d"
    instance_type = "t2.micro"
    tags = {
      Name = var.ec2name2
    }
    
}

output "instance_id2" {
  value = aws_instance.ec2-2.id  
}