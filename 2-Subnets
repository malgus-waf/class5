#These are   for  public

resource "aws_subnet" "public-eu-west-1a" {
  vpc_id                  = aws_vpc.app1.id
  cidr_block              = "10.32.1.0/24"
  availability_zone       = "eu-west-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-eu-west-1a"
    Service = "application1"
    Owner = "Chewbacca"
    Planet = "Musafar"
  }
}



#these are for private
resource "aws_subnet" "private-eu-west-1a" {
  vpc_id            = aws_vpc.app1.id
  cidr_block        = "10.32.11.0/24"
  availability_zone = "eu-west-1a"

  tags = {
    Name = "private-eu-west-1a"
    Service = "application1"
    Owner = "Chewbacca"
    Planet = "Musafar"
  }
}



