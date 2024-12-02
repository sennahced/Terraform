resource "aws_subnet" "AD_subnet_priv-1" {
  vpc_id = aws_vpc.vpc_adrien.id
  cidr_block = "10.0.4.0/24"
availability_zone = element(var.availability_zones, 0)
  tags = {
    Name = "AD_subnet_priv-1"
  }
}

resource "aws_subnet" "AD_subnet_priv-2" {
  vpc_id = aws_vpc.vpc_adrien.id
  cidr_block = "10.0.5.0/24"
  availability_zone = element(var.availability_zones, 1)
  tags = {
    Name = "AD_subnet_priv-2"
  }
}

resource "aws_subnet" "AD_subnet_priv-3" {
  vpc_id = aws_vpc.vpc_adrien.id
  cidr_block = "10.0.6.0/24"
  availability_zone = element(var.availability_zones, 2)
  tags = {
    Name = "AD_subnet_priv-3"
  }
}

resource "aws_route_table" "AD-route-table-prive" {
  vpc_id = aws_vpc.vpc_adrien.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.AD_NAT.id
  }
  tags = {
    Name = "AD-route-table-prive"
  }
}

resource "aws_eip" "AD_EIP" {
  domain = "vpc"
  tags = {
    Name = "AD_EIP"
  }
}

resource "aws_nat_gateway" "AD_NAT" {
  allocation_id = aws_eip.AD_EIP.id
  subnet_id = aws_subnet.AD_subnet-1.id
  tags = {
    Name = "AD_NAT"
  }
  
}

resource "aws_route_table_association" "AD_route_table_priv_association" {
  subnet_id = aws_subnet.AD_subnet_priv-1.id
  route_table_id = aws_route_table.AD-route-table-prive.id
}
resource "aws_route_table_association" "AD_route_table_priv_association2" {
  subnet_id = aws_subnet.AD_subnet_priv-2.id
  route_table_id = aws_route_table.AD-route-table-prive.id
}
resource "aws_route_table_association" "AD_route_table_priv_association3" {
  subnet_id = aws_subnet.AD_subnet_priv-3.id
  route_table_id = aws_route_table.AD-route-table-prive.id
}