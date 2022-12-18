variable "identifier_prefix" {
  description = "Creates a unique identifier beginning with the specified prefix"
  type = string
}

variable "username" {
  description = "The username for the database"
  type        = string
  sensitive   = true
}

variable "password" {
  description = "The password for the database"
  type        = string
  sensitive   = true
}