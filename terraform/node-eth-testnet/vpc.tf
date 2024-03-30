resource "aws_vpc" "vpc" {
  cidr_block = var.cidr_vpc
  provider   = aws.primary

  tags = {
    Name = var.name
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id   = aws_vpc.vpc.id
  provider = aws.primary

  tags = {
    Name = var.name
  }
}

resource "aws_subnet" "subnet_public_a" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.cidr_subnet_a
  map_public_ip_on_launch = "true"
  availability_zone       = "${var.region}a"
  provider                = aws.primary

  tags = {
    Name = "${var.name}-a"
  }
}

resource "aws_route_table" "rtb_public" {
  vpc_id   = aws_vpc.vpc.id
  provider = aws.primary

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = var.name
  }
}

resource "aws_route_table_association" "rta_subnet_public_a" {
  subnet_id      = aws_subnet.subnet_public_a.id
  route_table_id = aws_route_table.rtb_public.id
  provider       = aws.primary
}

resource "aws_key_pair" "deployment" {
  key_name   = "deployment-${var.name}"
  public_key = file(var.public_key_path)
  provider   = aws.primary
}
