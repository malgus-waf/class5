# Create an Internet Gateway and attach it to your VPC
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.app1.id

  tags = {
    Name = "app1-igw"
  }
}
