# projectib VPC
resource "aws_vpc" "projectib" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"
  tags = {
    Name = "projectib"
  }
}

# Subnets
resource "aws_subnet" "projectib-public-1" {
  vpc_id                  = aws_vpc.projectib.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-west-2a"

  tags = {
    Name = "projectib-public-1"
  }
}

resource "aws_subnet" "projectib-public-2" {
  vpc_id                  = aws_vpc.projectib.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-west-2b"

  tags = {
    Name = "projectib-public-2"
  }
}


resource "aws_subnet" "projectib-private-1" {
  vpc_id                  = aws_vpc.projectib.id
  cidr_block              = "10.0.4.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "us-west-2a"

  tags = {
    Name = "projectib-private-1"
  }
}

resource "aws_subnet" "projectib-private-2" {
  vpc_id                  = aws_vpc.projectib.id
  cidr_block              = "10.0.5.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "us-west-2b"

  tags = {
    Name = "projectib-private-2"
  }
}

# Internet GW
resource "aws_internet_gateway" "projectib-gw" {
  vpc_id = aws_vpc.projectib.id

  tags = {
    Name = "projectib"
  }
}

# route tables
resource "aws_route_table" "projectib-public" {
  vpc_id = aws_vpc.projectib.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.projectib-gw.id
  }

  tags = {
    Name = "projectib-public-1"
  }
}

# route associations public
resource "aws_route_table_association" "projectib-public-1-a" {
  subnet_id      = aws_subnet.projectib-public-1.id
  route_table_id = aws_route_table.projectib-public.id
}

resource "aws_route_table_association" "projectib-public-2-a" {
  subnet_id      = aws_subnet.projectib-public-2.id
  route_table_id = aws_route_table.projectib-public.id
}
