resource "aws_vpc" "devops-mtc-vpc" {
  cidr_block           = "10.123.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "dev"
  }
}

resource "aws_subnet" "devops-mtc-subnet" {
  vpc_id                  = aws_vpc.devops-mtc-vpc.id
  cidr_block              = "10.123.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"

  tags = {
    Name = "devops-subnet"
  }
}

resource "aws_internet_gateway" "devops-mtc-igw" {
  vpc_id = aws_vpc.devops-mtc-vpc.id

  tags = {
    Name = "devops-igw"
  }
}

resource "aws_route_table" "devops-mtc-rt" {
  vpc_id = aws_vpc.devops-mtc-vpc.id

  tags = {
    Name = "devops-rt"
  }
}

resource "aws_route" "default_route" {
  route_table_id         = aws_route_table.devops-mtc-rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.devops-mtc-igw.id
  #vpc_peering_connection_id = "pcx-45ff3dc1"
  #depends_on                = [aws_route_table.testing]
}

resource "aws_route_table_association" "devops-mtc-rt-assoc" {
  subnet_id      = aws_subnet.devops-mtc-subnet.id
  route_table_id = aws_route_table.devops-mtc-rt.id
}