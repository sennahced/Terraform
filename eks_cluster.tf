###################### Création du cluster EKS ######################
resource "aws_eks_cluster" "AD_EKS_cluster" {
  name     = "AD_EKS_cluster"
  role_arn = data.aws_iam_role.ADEKSRole.arn
  vpc_config {
    subnet_ids = [
      aws_subnet.AD_subnet-1.id,
      aws_subnet.AD_subnet-2.id,
      aws_subnet.AD_subnet-3.id
    ]
  }
  
}

###################### Add-ons nécessaires pour le cluster EKS ######################
resource "aws_eks_addon" "vpc_cni" {
  cluster_name  = aws_eks_cluster.AD_EKS_cluster.name
  addon_name    = "vpc-cni"
  addon_version = "v1.18.5-eksbuild.1"
}

resource "aws_eks_addon" "CoreDNS" {
  cluster_name = aws_eks_cluster.AD_EKS_cluster.name
  addon_name = "coredns"
  addon_version = "v1.11.3-eksbuild.1"
  resolve_conflicts_on_create = "OVERWRITE"

  configuration_values = jsonencode({
    replicaCount = 4
    resources = {
      limits = {
        cpu    = "100m"
        memory = "70Mi"
      }
      requests = {
        cpu    = "100m"
        memory = "70Mi"
      }
    }
  })
}

resource "aws_eks_addon" "kube-proxy" {
  cluster_name = aws_eks_cluster.AD_EKS_cluster.name
  addon_name = "kube-proxy"
  addon_version = "v1.31.0-eksbuild.5"
}