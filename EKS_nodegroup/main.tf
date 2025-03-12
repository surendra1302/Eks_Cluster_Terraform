resource "aws_eks_node_group" "My-nodegroup" {
    cluster_name = var.cluster_name
    node_group_name = var.node_groupname
    node_role_arn = data.aws_iam_role.pull_ami1.arn
    subnet_ids      = var.subnet_ids
    disk_size = "15"
    scaling_config {
      desired_size = var.desired_size
      max_size = var.maxvalue
      min_size = var.minvalue
    }
    instance_types = [var.instance_type]
    ami_type       = "AL2_x86_64"
    
    
}

data "aws_iam_role" "pull_ami1" {
  name = "EKS_Nodegroup_Role"
}

output "role_arn1" {
  value = data.aws_iam_role.pull_ami1.arn
}
