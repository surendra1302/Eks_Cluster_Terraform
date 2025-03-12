provider "aws" {
  region = "us-east-1"
}

module "EKS_cluster" {
    source = "./EKS_cluster"
    cluster_name = var.name
    subnet_ids = var.subnet_ids
}

module "EKS_nodegroup"{
    source = "./EKS_nodegroup"
    cluster_name = module.EKS_cluster.cluster_name
    desired_size = "4"
    maxvalue = "15"
    minvalue = "3"
    instance_type = "t3.medium"
    subnet_ids = var.subnet_ids
    depends_on = [ module.EKS_cluster ]
}
