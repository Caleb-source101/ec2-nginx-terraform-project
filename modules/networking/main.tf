resource "aws_vpc" "one" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "TF-VPC"
  }
}

resource "aws_subnet" "one" {
  vpc_id                  = aws_vpc.one.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "TF-subnet"
  }
}

resource "aws_internet_gateway" "one" {
  vpc_id = aws_vpc.one.id

  tags = {
    Name = "TF-IGW"
  }
}

resource "aws_route_table" "one" {
  vpc_id = aws_vpc.one.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.one.id
  }

  tags = {
    Name = "TF-RT"
  }
}

resource "aws_route_table_association" "one" {
  subnet_id      = aws_subnet.one.id
  route_table_id = aws_route_table.one.id
}

resource "aws_security_group" "one" {
  vpc_id = aws_vpc.one.id

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "TF-sG"
  }
}
