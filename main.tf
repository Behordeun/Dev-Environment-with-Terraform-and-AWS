resource "aws_vpc" "devops-mtc-vpc" {
  cidr_block = "10.123.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
    Name = "dev"
  }
}

resource "aws_subnet" "devops-mtc-subnet" {
  vpc_id     = aws_vpc.devops-mtc-vpc.id
  cidr_block = "10.123.1.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1a"

  tags = {
    Name = "Main"
  }
}

resource "aws_internet_gateway" "devops-mtc-igw" {
  vpc_id = aws_vpc.devops-mtc-vpc.id

  tags = {
    Name = "devops-igw"
  }
}
