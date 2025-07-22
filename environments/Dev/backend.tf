terraform {
  backend "s3" {
    bucket = "suman-tf-state-dev"
    key    = "network/terraform.tfstate"
    region = "eu-west-1"
  }
}
