# Cluster meta.tf
#
# This file contains the provider and metadata resources
# required to configure Terraform, plugins, state backend etc.
#

terraform {
  required_version = ">=0.11.9"
}

provider "kubernetes" {}
