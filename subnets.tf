resource "aws_subnet" "public_subnet01" {
  vpc_id            = aws_vpc.vpc.id
  availability_zone = "us-east-1a"
  cidr_block        = "10.0.1.0/24"
  tags = {
    Name = "public-app-01"
  }
}
resource "aws_subnet" "private_subnet01" {
  vpc_id            = aws_vpc.vpc.id
  availability_zone = "us-east-1a"
  cidr_block        = "10.0.2.0/24"
  tags = {
    Name = "private-app-01"
  }
}
resource "aws_subnet" "public_subnet02" {
  vpc_id            = aws_vpc.vpc.id
  availability_zone = "us-east-1b"
  cidr_block        = "10.0.3.0/24"
  tags = {
    Name = "public-app-02"
  }
}
resource "aws_subnet" "private_subnet02" {
  vpc_id            = aws_vpc.vpc.id
  availability_zone = "us-east-1b"
  cidr_block        = "10.0.4.0/24"
  tags = {
    Name = "private-app-02"
  }
}