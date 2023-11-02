resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.app1.id

  tags = {
    Name = "igw"
  }
}