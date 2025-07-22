provider "aws" {
  region = var.region
}

module "network" {
  source          = "../../modules/network"
  vpc_cidr        = var.vpc_cidr
  private_subnets = var.private_subnets
  region          = var.region
  environment     = var.environment
  tags            = var.tags
}

