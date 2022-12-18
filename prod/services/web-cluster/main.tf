provider "aws" {
  region = "ap-southeast-2"
  profile = "cst-test"
}

module "web_cluster" {
  source = "../../../modules/services/web-cluster"
  cluster_name = "webservers-prod"
  instance_type = "t2.micro"
  min_size = 2
  max_size = 10
  db_remote_state_bucket = "cst-test-terraform-state"
  db_remote_state_key = "prod/storage/mysql/terraform.tfstate"
}