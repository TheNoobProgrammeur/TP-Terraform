module "instance-1" {
  source                = "./modules"
  key-name              = var.key-name
  owner                 = var.owner
  ami-ID                = var.ami-ID
  instance-type         = var.instance-type
  nb-instance-by-subnet = var.nb-instance-by-subnet
}

output "dns" {
  value       = module.instance-1.elb-dns
  description = "DNS instance-1 elb"
}
