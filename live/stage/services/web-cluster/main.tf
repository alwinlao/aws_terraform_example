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
  #source = "github.com/alwinlao/aws_terraform_modules//services/web-cluster?ref=v0.0.1"
  source = "../../../../modules/services/web-cluster"
  cluster_name = "webservers-stage"
  instance_type = "t2.micro"
  min_size = 2
  max_size = 2
  db_remote_state_bucket = "cst-test-terraform-state"
  db_remote_state_key = "stage/storage/mysql/terraform.tfstate"

}

resource "aws_security_group_rule" "allow_testing_in" {
  security_group_id = module.web_cluster.alb_security_group_id
  type="ingress"
  from_port = 8080
  to_port = 8080
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}