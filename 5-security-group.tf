# Create a Security Group that allows inbound SSH, HTTP & outbound all traffic
resource "aws_security_group" "sg" {
  name        = "app1-sg"
  description = "Allow inbound SSH, HTTP & outbound all"
  vpc_id      = aws_vpc.app1.id

  ingress {
    description = "SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "app1-sg"
  }
}

