vpc_cidr = "192.0.0.0/20"

private_subnets = {
  "eu-west-1a" = "192.0.1.0/24"
  "eu-west-1b" = "192.0.2.0/24"
}

region      = "eu-west-1"
environment = "test"

tags = {
  Project     = "InfraProject"
  Environment = "test"
}
