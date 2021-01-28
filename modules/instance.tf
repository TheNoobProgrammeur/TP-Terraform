resource "aws_instance" "Instances-a" {
  count                  = var.nb-instance-by-subnet
  ami                    = var.ami
  instance_type          = var.instance-type
  subnet_id              = aws_subnet.int-private-subnet-a.id
  key_name               = var.key-name
  vpc_security_group_ids = [aws_security_group.int-webserver-sg.id]
  tags = {
    "Name"        = "Instance-a-${count.index}"
    "Owner"       = var.owner
    "Description" = "Instance ${count.index} on subnet a"
  }
}

resource "aws_instance" "Instances-b" {
  count                  = var.nb-instance-by-subnet
  ami                    = var.ami
  instance_type          = var.instance-type
  subnet_id              = aws_subnet.int-private-subnet-b.id
  key_name               = var.key-name
  vpc_security_group_ids = [aws_security_group.int-webserver-sg.id]
  tags = {
    "Name"        = "Instance-b-${count.index}"
    "Owner"       = var.owner
    "Description" = "Instance ${count.index} on subnet b"
  }
}
