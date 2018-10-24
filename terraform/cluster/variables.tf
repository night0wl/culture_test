variable "cluster_name" {
  type        = "string"
  description = "The FQDN of the K8s cluster"
}

variable "s3_bucket" {
  type        = "string"
  description = "The S3 bucket where the Gossip DNS config will be stored"
}

variable "zones" {
  type        = "list"
  description = "The AWS AZ to deploy the cluster to"
}
