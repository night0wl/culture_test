# Cluster main.tf
#
# This file contains the module definitions required to deploy a k8s cluster
#

module "kops_k8s_cluster" {
  source       = "../modules/kube"
  cluster_name = "${var.cluster_name}"
  s3_bucket    = "${var.s3_bucket}"
  zones        = "${var.zones}"
}
