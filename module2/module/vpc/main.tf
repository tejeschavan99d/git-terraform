resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr_range
  tags = {
    Name = "${var.env}-${var.app}-vpc"
  }
}
resource "aws_subnet" "public" {
  count = length(var.public_cidr_range)
  vpc_id = aws_vpc.vpc.id
  map_public_ip_on_launch = true
  cidr_block = var.public_cidr_range[count.index]
  tags = {
    Name = "${var.env}-${var.app}-public-subnet-${count.index + 1}"
  }
}
resource "aws_subnet" "private" {
  count = length(var.private_cidr_range)
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.private_cidr_range[count.index]
  tags = {
    Name = "${var.env}-${var.app}-private-subnet-${count.index + 1}"
  }
}
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.env}-${var.app}-igw"
  }
}
resource "aws_eip" "eip" {
  count = length(var.public_cidr_range)
  domain = "vpc"
  tags = {
    Name = "${var.env}-${var.app}-eip-${count.index + 1}"
  }
}
resource "aws_nat_gateway" "natgw" {
    count = length(var.public_cidr_range)
    allocation_id = aws_eip.eip[count.index].id
    subnet_id = aws_subnet.public[count.index].id
    tags = {
      Name = "${var.env}-${var.app}-nat-gw-${count.index + 1}"
    }
}
resource "aws_route_table" "public-rt" {
    vpc_id = aws_vpc.vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
    tags = {
      Name = "${var.env}-${var.app}-public-rt"
    }
}
resource "aws_route_table_association" "public-rt-asso" {
  count = length(var.public_cidr_range)
  route_table_id = aws_route_table.public-rt.id
  subnet_id = aws_subnet.public[count.index].id
}
resource "aws_route_table" "private-rt" {
  vpc_id = aws_vpc.vpc.id
  count = length(var.private_cidr_range)
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.natgw[count.index].id
  }
  tags = {
      Name = "${var.env}-${var.app}-private-rt"
    }
}
resource "aws_route_table_association" "private-rt-asso" {
  count = length(var.private_cidr_range)
  route_table_id = aws_route_table.private-rt[count.index].id
  subnet_id = aws_subnet.private[count.index].id
}