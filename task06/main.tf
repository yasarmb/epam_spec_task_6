resource "azurerm_resource_group" "main" {
  name     = local.rg_name
  location = var.region
  tags     = var.tags
}

data "azurerm_key_vault" "existing" {
  name                = var.existing_key_vault_name
  resource_group_name = var.existing_key_vault_resource_group_name
}

module "sql" {
  source = "./modules/sql"

  rg_name                                      = azurerm_resource_group.main.name
  region                                       = var.region
  sql_server_name                              = local.sql_server_name
  sql_db_name                                  = local.sql_db_name
  sql_database_service_model                   = var.sql_database_service_model
  sql_server_firewall_rule_name                = var.sql_server_firewall_rule_name
  sql_server_firewall_rule_name_specified      = var.sql_server_firewall_rule_name_specified
  allowed_ip_address                           = var.allowed_ip_address
  db_username                                  = var.db_username
  key-value-id                                 = data.azurerm_key_vault.existing.id
  key_vault_secret_name_for_sql_admin_name     = var.key_vault_secret_name_for_sql_admin_name
  existing_key_vault_resource_group_name       = data.azurerm_key_vault.existing.resource_group_name
  existing_key_vault_name                      = data.azurerm_key_vault.existing.name
  key_vault_secret_name_for_sql_admin_password = var.key_vault_secret_name_for_sql_admin_password
  tags                                         = var.tags
}

module "webapp" {
  source = "./modules/webapp"

  rg_name                        = azurerm_resource_group.main.name
  region                         = var.region
  asp_name                       = local.asp_name
  app_service_plan_sku           = var.app_service_plan_sku
  sql_connection_string          = module.sql.sql_connection_string
  app_name                       = local.app_name
  web_application_dotnet_version = var.web_application_dotnet_version
  tags                           = var.tags

}

