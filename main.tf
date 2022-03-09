# Create a VPC resource
resource "aws_vpc" "devops-mtc-vpc" {
  cidr_block           = "10.123.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "dev"
  }
}

# Create a subnet resource in the VPC
resource "aws_subnet" "devops-mtc-subnet" {
  vpc_id                  = aws_vpc.devops-mtc-vpc.id
  cidr_block              = "10.123.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"

  tags = {
    Name = "devops-subnet"
  }
}

# Create an internet gateway resource
resource "aws_internet_gateway" "devops-mtc-igw" {
  vpc_id = aws_vpc.devops-mtc-vpc.id

  tags = {
    Name = "devops-igw"
  }
}

# Create a route table resource in the VPC
resource "aws_route_table" "devops-mtc-rt" {
  vpc_id = aws_vpc.devops-mtc-vpc.id

  tags = {
    Name = "devops-rt"
  }
}

# Create a route resource
resource "aws_route" "default_route" {
  route_table_id         = aws_route_table.devops-mtc-rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.devops-mtc-igw.id
  #vpc_peering_connection_id = "pcx-45ff3dc1"
  #depends_on                = [aws_route_table.testing]
}

# Create a route table association
resource "aws_route_table_association" "devops-mtc-rt-assoc" {
  subnet_id      = aws_subnet.devops-mtc-subnet.id
  route_table_id = aws_route_table.devops-mtc-rt.id
}

# Create a security group resource
resource "aws_security_group" "devops-mtc-sg" {
  name        = "devops-sg"
  description = "devops security group"
  vpc_id      = aws_vpc.devops-mtc-vpc.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] # You should avoid this in production, but it's useful for local testing.
    # You should specify a specific ip address that can access your instance. Usually, it should be your private ip address.
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] # Leave this unchanged, so you can access the external internet.
  }
}

# Create a key pair
resource "aws_key_pair" "devops-mtc-auth" {
  key_name   = "devops-mtc-key"
  public_key = file("~/.ssh/devops-mtckey.pub")
}

# Create an instance
resource "aws_instance" "devops-mtc-node" {
  instance_type          = "t2.micro"
  ami                    = data.aws_ami.server_ami.id
  key_name               = aws_key_pair.devops-mtc-auth.id
  vpc_security_group_ids = [aws_security_group.devops-mtc-sg.id]
  subnet_id              = aws_subnet.devops-mtc-subnet.id
  user_data              = file("userdata.tpl")

  root_block_device {
    volume_size = 10
  }
  tags = {
    name = "devops-node"
  }

  # Provisioner(s) are a last resort. You will want to avoid using them as mush as possible.
  provisioner "local-exec" {
    command = templatefile("${var.host_os}-ssh-config.tpl", {
      hostname     = self.public_ip,
      user         = "ubuntu",
      identityfile = "~/.ssh/devops-mtckey",
    })

    interpreter = var.host_os == "windows" ? ["powershell", "-command"] : ["bash", "-c"] # For windows users
  }
}


