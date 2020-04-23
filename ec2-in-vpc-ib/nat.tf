# nat gtw eip 
resource "aws_eip" "nat" {
  vpc = true
}

#######################
# NAT for zone a
resource "aws_nat_gateway" "nat-gw-1" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.projectib-public-1.id
  depends_on    = [aws_internet_gateway.projectib-gw]
}

# NAT routing table for zone a
resource "aws_route_table" "projectib-private-1" {
  vpc_id = aws_vpc.projectib.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-gw-1.id
  }

  tags = {
    Name = "projectib-private-1"
  }
}

# route associations private
resource "aws_route_table_association" "projectib-private-1" {
  subnet_id      = aws_subnet.projectib-private-1.id
  route_table_id = aws_route_table.projectib-private-1.id
}

##############################

# NAT for zone b, private 2
resource "aws_nat_gateway" "nat-gw-2" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.projectib-public-2.id
  depends_on    = [aws_internet_gateway.projectib-gw]
}

# VPC setup for NAT
resource "aws_route_table" "projectib-private-2" {
  vpc_id = aws_vpc.projectib.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-gw-2.id
  }

  tags = {
    Name = "projectib-private-2"
  }
}

resource "aws_route_table_association" "projectib-private-2" {
  subnet_id      = aws_subnet.projectib-private-2.id
  route_table_id = aws_route_table.projectib-private-2.id
}