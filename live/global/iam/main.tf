terraform {
  backend "s3" {
    key = "global/iam/terraform.tfstate"
  }
}

provider "aws" {
  region  = var.region
  profile = var.profile
}

module "users" {
  source = "../../../modules/landing-zone/iam-user"

  for_each = toset(var.user_names)
  user_name = each.value
}