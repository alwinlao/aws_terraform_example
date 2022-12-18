output "db_address" {
  value       = module.mysql.db_address
  description = "Connect to the database at this endpoint"
}

output "db_port" {
  value       = module.mysql.db_port
  description = "The port the database is listening on"
}