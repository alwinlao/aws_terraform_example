terraform {
  backend "s3" { 
    key            = "prod/storage/mysql/terraform.tfstate"
  }
}

provider "aws" {
  region = "ap-southeast-2"
  profile = "cst-test"
}

module "mysql" {
    source = "../../../modules/storage/mysql"
}