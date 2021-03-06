resource "aws_vpc" "main-zone" {

  cidr_block = "10.0.0.0/17"

  tags = {
    "Name"  = "main-zone-${var.owner}"
    "Owner" = var.owner
  }
}

resource "aws_subnet" "int-public-subnet-a" {
  vpc_id            = aws_vpc.main-zone.id
  availability_zone = "eu-west-1a"
  cidr_block        = "10.0.2.0/24"

  tags = {
    "Name"        = "int-${var.owner}-public-subnet-a"
    "Owner"       = var.owner
    "Description" = "Public subnet a"
  }
}

resource "aws_subnet" "int-private-subnet-a" {
  vpc_id            = aws_vpc.main-zone.id
  availability_zone = "eu-west-1a"
  cidr_block        = "10.0.0.0/24"
  tags = {
    "Name"        = "int-${var.owner}-private-subnet-a"
    "Owner"       = var.owner
    "Description" = "Private subnet a"
  }
}

resource "aws_subnet" "int-public-subnet-b" {
  vpc_id            = aws_vpc.main-zone.id
  availability_zone = "eu-west-1b"
  cidr_block        = "10.0.3.0/24"
  tags = {
    "Name"        = "int-${var.owner}-public-subnet-b"
    "Owner"       = var.owner
    "Description" = "Public subnet b"
  }

}

resource "aws_subnet" "int-private-subnet-b" {
  availability_zone = "eu-west-1b"
  vpc_id            = aws_vpc.main-zone.id
  cidr_block        = "10.0.1.0/24"
  tags = {
    "Name"        = "int-${var.owner}-private-subnet-b"
    "Owner"       = var.owner
    "Description" = "Private subnet b"
  }

}
