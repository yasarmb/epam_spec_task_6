output "sql_server_fqdn" {
  description = "SQL Server fully qualified domain name"
  value       = azurerm_mssql_server.main.fully_qualified_domain_name

}



output "sql_connection_string" {
  description = "Database connection string"
  value       = "Server=${azurerm_mssql_server.main.fully_qualified_domain_name};Database=${azurerm_mssql_database.main.name};User Id=${var.db_username};Password=${azurerm_mssql_server.main.administrator_login_password};"
  sensitive   = true
}
