resource "aws_eip" "nat_eip" {
  vpc = true
}

resource "aws_nat_gateway" "nat-gatway" {

  subnet_id     = aws_subnet.int-public-subnet-a.id
  allocation_id = aws_eip.nat_eip.id

  tags = {
    "Name"  = "nat-gatway-${var.owner}"
    "Owner" = var.owner
  }
}


resource "aws_route_table" "route-table-private" {
  vpc_id = aws_vpc.landing-zone.id

  tags = {
    "Name"  = "route-table-private-${var.owner}"
    "Owner" = var.owner
  }
}


resource "aws_route" "route-nat-gatway" {
  route_table_id         = aws_route_table.route-table-private.id
  nat_gateway_id         = aws_nat_gateway.nat-gatway.id
  destination_cidr_block = "0.0.0.0/0"
}


resource "aws_route_table_association" "table-association-private-a" {
  subnet_id      = aws_subnet.int-private-subnet-a.id
  route_table_id = aws_route_table.route-table-private.id
}

resource "aws_route_table_association" "table-association-private-b" {
  subnet_id      = aws_subnet.int-private-subnet-b.id
  route_table_id = aws_route_table.route-table-private.id
}
