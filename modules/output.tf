output "elb-dns" {
  value       = aws_elb.lb.dns_name
  description = "DNS elb"
}


