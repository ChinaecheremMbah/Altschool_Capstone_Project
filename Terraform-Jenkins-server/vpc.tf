data "aws_availability_z0nes" "azs" {}
module "vpc" {
source = "terraform-aws-modules/vpc/aws"
name = "jenkins-server_vpc"
cidr = "10.0.0.0/16"
azs             = ["eu-west-2a", "eu-west2b", "eu-west2c"]
private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

enable_nat_gateway = true
enable_vpn_gateway = true

tags = {
Terraform = "true"
Environment = "dev"
}

public_subnet_tags = {
name = "jenkins-server"
}

private_subnet_tags = {
name = "jenkins-server"

}
}