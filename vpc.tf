
resource "aws_vpc" "dev" {
  cidr_block           = "10.0.0.0/24"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  tags = {
    Name = "dev"
  }
}
# Creating Public Subnets in VPC
resource "aws_subnet" "dev-public-1" {
  vpc_id                  = aws_vpc.dev.id
  cidr_block              = "10.0.0.0/28"
  map_public_ip_on_launch = "true"
  tags = {
    Name = "dev-public-1"
  }
}

# Creating Private Subnets in VPC
resource "aws_subnet" "dev-private-1" {
  vpc_id                  = aws_vpc.dev.id
  cidr_block              = "10.0.0.16/28"
  map_public_ip_on_launch = "false"
  tags = {
    Name = "dev-private-1"
  }
}
resource "aws_subnet" "dev-private-2" {
  vpc_id                  = aws_vpc.dev.id
  cidr_block              = "10.0.0.32/28"
  map_public_ip_on_launch = "false"
  tags = {
    Name = "dev-private-2"
  }
}
# Creating Internet Gateway in AWS VPC
resource "aws_internet_gateway" "dev-gw" {
  vpc_id = aws_vpc.dev.id
  tags = {
    Name = "dev"
  }
}
# Creating Route Tables for Internet gateway
resource "aws_route_table" "dev-public" {
  vpc_id = aws_vpc.dev.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dev-gw.id
  }
  tags = {
    Name = "dev-public-1"
  }
}
# Creating Route Associations public subnets
resource "aws_route_table_association" "dev-public-1-a" {
  subnet_id      = aws_subnet.dev-public-1.id
  route_table_id = aws_route_table.dev-public.id
}
