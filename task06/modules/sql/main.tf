resource "random_password" "db_password" {
  length  = 10
  special = true
  upper   = true
}


resource "azurerm_mssql_server" "main" {
  name                         = var.sql_server_name
  resource_group_name          = var.resource_group_name
  location                     = var.region
  version                      = "12.0"
  administrator_login          = var.db_username
  administrator_login_password = random_password.db_password.result
  tags                         = var.tags

}

resource "azurerm_mssql_database" "main" {
  name      = var.sql_database_name
  server_id = azurerm_mssql_server.main.id
  sku_name  = var.sql_database_service_model
  tags      = var.tags
}

resource "azurerm_mssql_firewall_rule" "specified" {
  name             = var.sql_server_firewall_rule_name_specified
  server_id        = azurerm_mssql_server.main.id
  start_ip_address = var.allowed_ip_address
  end_ip_address   = var.allowed_ip_address
}

resource "azurerm_mssql_firewall_rule" "azure_services" {
  name             = "AllowAzureServices"
  server_id        = azurerm_mssql_server.main.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"

}

resource "azurerm_key_vault_secret" "db-username" {
  name         = var.key_vault_secret_name_for_sql_admin_name
  value        = azurerm_mssql_server.main.administrator_login
  key_vault_id = var.key-value-id
  tags         = var.tags
}

resource "azurerm_key_vault_secret" "password" {
  name         = var.key_vault_secret_name_for_sql_admin_password
  value        = azurerm_mssql_server.main.administrator_login_password
  key_vault_id = var.key-value-id
  tags         = var.tags
}

