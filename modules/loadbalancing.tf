resource "aws_elb" "lb" {

  security_groups = [aws_security_group.int-lb-sg.id]

  instances = [for instance in concat(aws_instance.Instances-a, aws_instance.Instances-b) : instance.id]
  subnets = [
    aws_subnet.int-public-subnet-a.id,
    aws_subnet.int-public-subnet-b.id
  ]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 10
    unhealthy_threshold = 2
    timeout             = 5
    target              = "HTTP:80/"
    interval            = 30
  }

  cross_zone_load_balancing = true
  connection_draining       = true



  tags = {
    "Name"  = "antoine-lb"
    "Owner" = var.owner
  }
}
