resource "aws_subnet" "AD_subnet-1" {
  vpc_id = aws_vpc.vpc_adrien.id
  cidr_block = "10.0.1.0/24"
  availability_zone = element(var.availability_zones, 0)
  map_public_ip_on_launch = true
  tags = {
    Name = "AD_subnet-1"
  }
}

resource "aws_subnet" "AD_subnet-2" {
  vpc_id = aws_vpc.vpc_adrien.id
  cidr_block = "10.0.2.0/24"
  availability_zone = element(var.availability_zones, 1)
  map_public_ip_on_launch = true
  tags = {
    Name = "AD_subnet-2"
  }
}

resource "aws_subnet" "AD_subnet-3" {
  vpc_id = aws_vpc.vpc_adrien.id
  cidr_block = "10.0.3.0/24"
  availability_zone = element(var.availability_zones, 2)
  map_public_ip_on_launch = true
  tags = {
    Name = "AD_subnet-3"
  }
}

resource "aws_route_table" "AD-route-table-publique" {
  vpc_id = aws_vpc.vpc_adrien.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.AD_IGW.id
  }
  tags = {
    Name = "AD-route-table-publique"
  }
}
resource "aws_internet_gateway" "AD_IGW" {
  vpc_id = aws_vpc.vpc_adrien.id
  tags = {
    Name = "AD_IGW"
  }
  
}

resource "aws_route_table_association" "AD_route_table_association" {
  subnet_id = aws_subnet.AD_subnet-1.id
  route_table_id = aws_route_table.AD-route-table-publique.id
}
resource "aws_route_table_association" "AD_route_table_association2" {
  subnet_id = aws_subnet.AD_subnet-2.id
  route_table_id = aws_route_table.AD-route-table-publique.id
}
resource "aws_route_table_association" "AD_route_table_association3" {
  subnet_id = aws_subnet.AD_subnet-3.id
  route_table_id = aws_route_table.AD-route-table-publique.id
}