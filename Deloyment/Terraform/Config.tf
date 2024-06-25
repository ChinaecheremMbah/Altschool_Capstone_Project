 provider "aws" {
  region = "eu-west-2"
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

# configuring the TLS certificate
provider "kubernetes" {
  host = "https://104.196.242.174"

  client_certificate     = "${file("~/.kube/client-cert.pem")}"
  client_key             = "${file("~/.kube/client-key.pem")}"
  cluster_ca_certificate = "${file("~/.kube/cluster-ca-cert.pem")}"
}
#configuring the kubernetes cluster provider
provider "kubernetes" {
  host                   = module.eks_blueprints.eks_cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks_blueprints.eks_cluster_certificate_authority_data)
}