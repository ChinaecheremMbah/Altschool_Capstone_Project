terraform {
  backend "s3" {
    bucket = "socks-shop-app"
    region = "eu-west-2"
    key = "Terraform-Jenkins-server/terraform3.tfvars"
  }
}

