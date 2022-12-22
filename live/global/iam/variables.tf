variable "user_names" {
  description = "Create IAM users with these names"
  type        = list(string)
  default     = ["superman", "batman", "spiderman"]
}

variable "region" {
  description = "AWS region"
  type        = string
}

variable "profile" {
  description = "AWS profile"
  type        = string
}