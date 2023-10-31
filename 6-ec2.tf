resource "aws_instance" "app1" {
  ami           = "ami-0c94855ba95c574c8" # Replace with the AMI ID you need
  instance_type = "t2.micro"

  subnet_id                   = aws_subnet.public-eu-west-1a.id
  vpc_security_group_ids      = [aws_security_group.sg.id]
  associate_public_ip_address = true

  tags = {
    Name     = "app1-instance"
    Service  = "application1"
    Owner    = "Chewbacca"
    Planet   = "Musafar"
  }
}