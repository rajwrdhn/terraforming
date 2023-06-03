variable "ec2name" {
  type = string
  description = "set ec2 name :"
}

resource "aws_instance" "ec2" {
    ami = "ami-0ec7f9846da6b0f61"
    instance_type = "t2.micro"
    tags = {
      Name = var.ec2name
    }
    
}

output "instance_id" {
  value = aws_instance.ec2.id  
}