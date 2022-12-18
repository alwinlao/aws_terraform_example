terraform {
  backend "s3" { 
    key            = "stage/services/web-cluster/terraform.tfstate"
  }
}

provider "aws" {
  region = "ap-southeast-2"
  profile = "cst-test"
}

module "web_cluster" {
  source = "../../../modules/services/web-cluster"
  cluster_name = "webservers-stage"
  instance_type = "t2.micro"
  min_size = 2
  max_size = 2
  db_remote_state_bucket = "cst-test-terraform-state"
  db_remote_state_key = "stage/storage/mysql/terraform.tfstate"

}