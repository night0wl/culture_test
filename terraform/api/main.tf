# API main.tf
#
# This file contains the modules required to deploy the API Pod

module "api" {
  source      = "../modules/api"
  environment = "${var.environment}"
}
