# Cluster main.tf
#
# This file contains the module definitions required to deploy a k8s cluster
#

module "kops_k8s_cluster" {
  source       = "../modules/kube"
  cluster_name = "alphacluster.k8s.local"
  s3_bucket    = "mrevell-culture-trip"
  zones        = "eu-west-1a"
}
