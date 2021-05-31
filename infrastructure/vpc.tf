provider "aws" {
  region = "${var.region}"
}

terraform {
  backend "s3" {}
}

resource "aws_vpc" "prodction_vpc" {
  cidr_block            = "${var.vpc_cidr}"
  enable_dns_hostnames  = true

  tags = {
    "Name" = "Production-VPC"
  }
}

resource "aws_subnet" "public-subnet-1" {
  cidr_block          = "${var.public_subnet_1_cidr}"
  vpc_id              = "${aws_vpc.prodction_vpc.id}"
  availability_zone   = "eu-west-1a"
  tags = {
    Name = "Public-Subnet-1"
  }
}

resource "aws_subnet" "public-subnet-2" {
  cidr_block          = "${var.public_subnet_2_cidr}"
  vpc_id              = "${aws_vpc.prodction_vpc.id}"
  availability_zone   = "eu-west-1b"
  tags = {
    Name = "Public-Subnet-2"
  }
}

resource "aws_subnet" "public-subnet-3" {
  cidr_block          = "${var.public_subnet_3_cidr}"
  vpc_id              = "${aws_vpc.prodction_vpc.id}"
  availability_zone   = "eu-west-1c"
  tags = {
    Name = "Public-Subnet-3"
  }
}

resource "aws_subnet" "private-subnet-1" {
  cidr_block            = "${var.private_subnet_1_cidr}"
  vpc_id                = "${aws_vpc.prodction_vpc.id}"
  availability_zone     = "eu-west-1a"
  tags = {
    Name = "Private-Subnet-1"
  }
}

resource "aws_subnet" "private-subnet-2" {
  cidr_block            = "${var.private_subnet_2_cidr}"
  vpc_id                = "${aws_vpc.prodction_vpc.id}"
  availability_zone     = "eu-west-1b"
  tags = {
    Name = "Private-Subnet-2"
  }
}

resource "aws_subnet" "private-subnet-3" {
  cidr_block            = "${var.private_subnet_3_cidr}"
  vpc_id                = "${aws_vpc.prodction_vpc.id}"
  availability_zone     = "eu-west-1c"
  tags = {
    Name = "Private-Subnet-3"
  }
}

resource "aws_route_table" "public-route-table" {
  vpc_id = "${aws_vpc.prodction_vpc.id}"
  tags = {
    Name = "Public-Route-Table"
  }
}

resource "aws_route_table" "private-route-table" {
  vpc_id = "${aws_vpc.prodction_vpc.id}"
  tags = {
    Name = "Private-Route-Table"
  }
}

resource "aws_route_table_association" "public-route-table-1-association" {
  vpc_id          = "${aws_route_table.public-route-table.id}"
  route_table_id  = "${aws_subnet.public-subnet-1}"
}

resource "aws_route_table_association" "public-route-table-2-association" {
  vpc_id          = "${aws_route_table.public-route-table.id}"
  route_table_id  = "${aws_subnet.public-subnet-2}"
}

resource "aws_route_table_association" "public-route-table-3-association" {
  vpc_id          = "${aws_route_table.public-route-table.id}"
  route_table_id  = "${aws_subnet.public-subnet-3}"
}

resource "aws_route_table_association" "private-route-table-1-association" {
  vpc_id          = "${aws_route_table.private-route-table.id}"
  route_table_id  = "${aws_subnet.private-subnet-1}"
}

resource "aws_route_table_association" "private-route-table-2-association" {
  vpc_id          = "${aws_route_table.private-route-table.id}"
  route_table_id  = "${aws_subnet.private-subnet-2}"
}

resource "aws_route_table_association" "private-route-table-3-association" {
  vpc_id          = "${aws_route_table.private-route-table.id}"
  route_table_id  = "${aws_subnet.private-subnet-3}"
}

resource "aws_eip" "elastic-ip-for-nat-gw" {
  vpc                       = "true"
  associate_with_private_ip = "10.0.0.5"
  tags = {
    Name = "Production-EIP"
  }
}