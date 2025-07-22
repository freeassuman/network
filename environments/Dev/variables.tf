variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "private_subnets" {
  description = "Map of availability zones to private subnet CIDRs"
  type        = map(string)
}

variable "region" {
  description = "AWS region"
  type        = string
}

variable "environment" {
  description = "Environment name (dev/test/prod)"
  type        = string
}

variable "tags" {
  description = "Common tags for resources"
  type        = map(string)
}
