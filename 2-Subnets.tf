#These are   for  public

resource "aws_subnet" "public-us-east-1a" {
  vpc_id                  = aws_vpc.app1.id
  cidr_block              = "10.99.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-us-east-1a"
    Service = "hashicorp"
    Owner = "terrando"
    Planet = "zulu"
  }
}

resource "aws_subnet" "public-us-east-1b" {
  vpc_id                  = aws_vpc.app1.id
  cidr_block              = "10.99.2.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-us-east-1a"
    Service = "hashicorp"
    Owner = "terrando"
    Planet = "zulu"
  }
}




#these are for private
resource "aws_subnet" "private-us-east-1a" {
  vpc_id            = aws_vpc.app1.id
  cidr_block        = "10.99.11.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "private-us-east-11a"
    Service = "hashicorp"
    Owner = "terrando"
    Planet = "zulu"
  }
}



#these are for private
resource "aws_subnet" "private-us-east-1b" {
  vpc_id            = aws_vpc.app1.id
  cidr_block        = "10.99.12.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "private-us-east-11a"
    Service = "hashicorp"
    Owner = "terrando"
    Planet = "zulu"
  }
}
