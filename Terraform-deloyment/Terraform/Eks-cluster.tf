module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = "socks-shop-eks-cluster"
  cluster_version = "1.29"

  cluster_endpoint_public_access  = true

  vpc_id                   = module.socks-shop_vpc.vpc_id
  subnet_ids               = module.socks-shop_vpc.private_subnets
  

  eks_managed_node_groups = {
    example = {
      min_size     = 1
      max_size     = 3
      desired_size = 2

      instance_types = ["t2.medium"]
    }
  }

  tags = {
    Environment = "development"
    application = "sock-shop"
  }
}