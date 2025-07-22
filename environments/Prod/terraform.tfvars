vpc_cidr = "172.0.0.0/20"

private_subnets = {
  "eu-west-1a" = "172.0.1.0/24"
  "eu-west-1b" = "172.0.2.0/24"
}

region      = "eu-west-1"
environment = "prod"

tags = {
  Project     = "InfraProject"
  Environment = "prod"
}
