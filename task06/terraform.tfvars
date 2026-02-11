region                                       = "East US"
existing_key_vault_resource_group_name       = "cmaz-wxu9jawu-mod6-kv-rg"
existing_key_vault_name                      = "cmaz-wxu9jawu-mod6-kv"
resource_group_name                          = "cmaz-wxu9jawu-mod6-rg"
key_vault_secret_name_for_sql_admin_name     = "sql-admin-name"
key_vault_secret_name_for_sql_admin_password = "sql-admin-password"
sql_server_name                              = "cmaz-wxu9jawu-mod6-sql"
sql_database_name                            = "cmaz-wxu9jawu-mod6-sql-db"
sql_database_service_model                   = "Basic"
sql_server_firewall_rule_name                = "AllowAzureServices"
app_service_plan_name                        = "cmaz-wxu9jawu-mod6-asp"
app_service_plan_sku                         = "P0v3"

tags = {
  Creator ="yasarmehmet_bagdatli@epam.com"
}

allowed_ip_address                          = "18.153.146.156"
db_username                                 = "sqladmin"
name_prefix                                 = "cmaz-wxu9jawu-mod6-"
sql_server_firewall_rule_name_specified     = "allow-verification-ip"
web_application_name                        = "cmaz-wxu9jawu-mod6-app"
web_application_dotnet_version              = "8.0"