resource "aws_internet_gateway" "internet-gateway" {
  vpc_id = aws_vpc.landing-zone.id

  tags = {
    "Name"  = "internet-gateway-${var.owner}"
    "Owner" = var.owner
  }
}

resource "aws_route_table" "route-table-public" {
  vpc_id = aws_vpc.landing-zone.id

  tags = {
    "Name"  = "route-table-public-${var.owner}"
    "Owner" = var.owner
  }
}

resource "aws_route" "route-internet-gateway" {
  route_table_id         = aws_route_table.route-table-public.id
  gateway_id             = aws_internet_gateway.internet-gateway.id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route_table_association" "table-association-public-a" {
  subnet_id      = aws_subnet.int-public-subnet-a.id
  route_table_id = aws_route_table.route-table-public.id
}

resource "aws_route_table_association" "table-association-public-b" {
  subnet_id      = aws_subnet.int-public-subnet-b.id
  route_table_id = aws_route_table.route-table-public.id
}


