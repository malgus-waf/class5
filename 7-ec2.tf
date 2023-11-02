resource "aws_instance" "newfamily01" {
 ami = "ami-087aa1047ad362e44"
 instance_type = "t2.micro"
 key_name = "dev1"
 vpc_security_group_ids = [aws_security_group.my-first-terraform-VPC.id]
 subnet_id = aws_subnet.public-us-east-1a.id
 
 tags = {
  Name = "userdatainstance"
 }

 user_data = "${file("user_data.sh")}"
}

