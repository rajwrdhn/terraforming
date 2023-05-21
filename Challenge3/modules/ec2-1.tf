variable "ec2name1" {
  type = string
}

resource "aws_instance" "ec2-1" {
    ami = "ami-0ec7f9846da6b0f61"
    instance_type = "t2.micro"
    tags = {
      Name = var.ec2name1
    }
    
}

output "instance_id1" {
  value = aws_instance.ec2-1.id  
}