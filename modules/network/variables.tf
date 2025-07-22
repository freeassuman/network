variable "vpc_cidr" {}

variable "region" {}

variable "environment" {}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs"
  type        = list(string)
  default     = []
}

variable "private_subnets" {
  description = "Map of availability zones to private subnet CIDRs"
  type        = map(string)
}