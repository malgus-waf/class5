# Create a Route Table for the public subnet
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.app1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "app1-public-rt"
  }
}

# Associate the Route Table with the public subnet
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public-eu-west-1a.id
  route_table_id = aws_route_table.public.id
}

