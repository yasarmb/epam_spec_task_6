output "sql_server_fqdn" {
  description = "SQL Server fully qualified domain name"
  value       = azurerm_mssql_server.main.fully_qualified_domain_name

}



output "sql_connection_string" {
  description = "ADO.NET connection string for the provisioned SQL DB"
  value = format(
    "Server=tcp:%s,1433;Initial Catalog=%s;Persist Security Info=False;User ID=%s;Password=%s;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;",
    azurerm_mssql_server.main.fully_qualified_domain_name,
    azurerm_mssql_database.main.name,
    var.db_username,
    random_password.db_password.result
  )
  sensitive = true
}
