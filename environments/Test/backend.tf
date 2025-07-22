terraform {
  backend "s3" {
    bucket = "suman-tf-state-test"
    key    = "network/terraform.tfstate"
    region = "eu-west-1"
  }
}
