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

resource "aws_autoscaling_schedule" "scale_out_biz" {
  scheduled_action_name = "scale_out_biz_hours"
  min_size = 2
  max_size = 10
  desired_capacity = 10
  recurrence = "0 9 * * *"

  autoscaling_group_name = module.web_cluster.asg_name
}

resource "aws_autoscaling_schedule" "scale_in_after_biz" {
  scheduled_action_name = "scale_in_after_biz"
  min_size = 2
  max_size = 10
  desired_capacity = 2
  recurrence = "0 17 * * *"

  autoscaling_group_name = module.web_cluster.asg_name
}