resource "aws_eks_node_group" "AD_EKS_node-group" {
  cluster_name = aws_eks_cluster.AD_EKS_cluster.name
    node_group_name = "AD_EKS_node-group"
    node_role_arn = data.aws_iam_role.ADEKSRole.arn
    subnet_ids = [
      aws_subnet.AD_subnet-1.id,
      aws_subnet.AD_subnet-2.id,
      aws_subnet.AD_subnet-3.id
    ]
    scaling_config {
      desired_size = 2
      max_size     = 3
      min_size     = 2
    }
    instance_types = ["t2.micro"]
    
}