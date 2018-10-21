# Kube kops.tf
#
# This file contains the TF resources required to execute kops to deploy / destroy a cluster
#

resource "null_resource" "create_destroy_cluster" {

  provisioner "local-exec" {
    command = "kops create cluster ${var.cluster_name} --state=s3://${var.s3_bucket} --zones ${var.zones} --master-size=${var.master_size} --node-size=${var.node_size} --yes"
  }

  provisioner "local-exec" {
    when    = "destroy"
    command = "kops delete cluster ${var.cluster_name} --state=s3://${var.s3_bucket} --yes"
  }
}
