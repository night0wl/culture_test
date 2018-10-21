# Kube variables.tf
#
# This file contains all the variables required as input for the module
#

variable "cluster_name" {
  type        = "string"
  description = "The FQDN name of the cluster e.g. example.k8s.local"
}

variable "s3_bucket" {
  type        = "string"
  description = "The S3 bucket name to use for the k8s cluster state / gossip DNS"
}

variable "zones" {
# TODO: This should be a list and be interpolated to a comma separated string
  type        = "string"
  description = "The AWS AZ to deploy the cluster to"
}

variable "master_size" {
  type        = "string"
  description = "The AWS instance type to use for the k8s cluster master"
  default     = "t2.medium"
}

variable "node_size" {
  type        = "string"
  description = "The AWS instance type to use for the k8s cluster nodes"
  default     = "t2.nano"
}
