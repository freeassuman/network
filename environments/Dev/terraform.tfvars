vpc_cidr = "10.0.0.0/20"

private_subnets = {
  "eu-west-1a" = "10.0.1.0/24"
  "eu-west-1b" = "10.0.2.0/24"
}

region      = "eu-west-1"
environment = "dev"

tags = {
  Project     = "InfraProject"
  Environment = "dev"
}
