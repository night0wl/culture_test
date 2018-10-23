# API variables.tf
#
# This file contains all the variables required as input for the module
#

variable "environment" {
  type        = "string"
  description = "Name of the environment to be deployed"
}
