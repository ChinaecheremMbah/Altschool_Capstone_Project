terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }

  }
}

provider "aws" {
  access_key = var.AWS_ACCESS_KEY_ID
  secret_key = var.AWS_SECRET_ACCESS_KEY
  region     = "eu-west-2"
}


resource "aws_vpc" "socks_shop_server" {
  cidr_block = var.vpc_cidr_block
}

resource "aws_subnet" "socks_shop_server" {
  vpc_id            = aws_vpc.socks_shop_server.id
  cidr_block        = var.subnet_cidr_block
  availability_zone = var.avail_zone
}


locals {
  policy = jsonencode({
    Version = "2012-10-17",
    Id      = "Policy1711532867449",
    Statement = [
      {
        Sid    = "Stmt1711532846175",
        Effect = "Allow",
        Principal = {
          AWS = "arn:aws:iam::841368019569:user/Starr"
        },
        Action   = "s3:*",
        Resource = "arn:aws:s3:::socks-shop-app"
      }
    ]
  })
}

resource "aws_iam_policy" "example" {
  name   = "${var.env_prefix}_policy"
  policy = local.policy
}
