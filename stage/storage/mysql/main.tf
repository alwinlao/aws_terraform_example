terraform {
  backend "s3" { 
    key            = "stage/storage/mysql/terraform.tfstate"
  }
}

provider "aws" {
  region = "ap-southeast-2"
  profile = "cst-test"
}

module "mysql" {
    source = "../../../modules/storage/mysql"
    identifier_prefix = "mysql-stage"
    username = var.db_username
    password = var.db_password
}