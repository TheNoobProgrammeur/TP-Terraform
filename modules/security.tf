resource "aws_security_group" "int-lb-sg" {
  name        = "int-lb-sg"
  description = "Security groupe du lb"
  vpc_id      = aws_vpc.landing-zone.id
  tags = {
    "Name"  = "int-lb-sg"
    "Owner" = var.owner
  }
}

resource "aws_security_group" "int-webserver-sg" {
  description = "Security groupe des instances"
  name        = "int-webserver-sg"
  vpc_id      = aws_vpc.landing-zone.id
  tags = {
    "Name"  = "int-webserver-sg"
    "Owner" = var.owner
  }

}

resource "aws_security_group_rule" "ingress-all-http-security-rule" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.int-lb-sg.id
}


resource "aws_security_group_rule" "outbound-webserver-http-security-rule" {
  type                     = "egress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.int-webserver-sg.id
  security_group_id        = aws_security_group.int-lb-sg.id
}


resource "aws_security_group_rule" "ingress-lb-http-security-rule" {
  type      = "ingress"
  from_port = 80
  to_port   = 80
  protocol  = "tcp"

  source_security_group_id = aws_security_group.int-lb-sg.id
  security_group_id        = aws_security_group.int-webserver-sg.id
}


resource "aws_security_group_rule" "outbound-lb-http-security-rule" {
  type              = "egress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.int-webserver-sg.id
}
