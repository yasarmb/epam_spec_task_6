variable "region" {
  description = "The region to deploy resources in."
  type        = string
}

variable "existing_key_vault_resource_group_name" {
  description = "The name of the resource group where the existing Key Vault is located."
  type        = string
}

variable "existing_key_vault_name" {
  description = "The name of the existing Key Vault to use for storing secrets."
  type        = string
}

variable "rg_name" {
  description = "The name of the resource group to create."
  type        = string
}

variable "key_vault_secret_name_for_sql_admin_name" {
  description = "The name of the secret in Key Vault that will store the SQL admin username."
  type        = string

}

variable "key_vault_secret_name_for_sql_admin_password" {
  description = "The name of the secret in Key Vault that will store the SQL admin password."
  type        = string
  sensitive   = true
}

variable "sql_server_name" {
  description = "The name of the SQL Server to create."
  type        = string
}

variable "sql_db_name" {
  description = "The name of the SQL Database to create."
  type        = string
}

variable "sql_database_service_model" {
  description = "The service model for the SQL Database (e.g., 'Basic', 'Standard', 'Premium')."
  type        = string
}

variable "sql_server_firewall_rule_name" {
  description = "The name of the firewall rule to create for the SQL Server."
  type        = string
}

variable "asp_name" {
  description = "The SKU for the App Service Plan (e.g., 'F1', 'B1', 'S1')."
  type        = string
}

variable "app_service_plan_sku" {
  description = "The SKU for the App Service Plan (e.g., 'F1', 'B1', 'S1')."
  type        = string
}

variable "app_name" {
  description = "The name of the Web Application to create."
  type        = string
}

variable "web_application_dotnet_version" {
  description = "The .NET version to use for the Web Application (e.g., 'v4.0', 'v5.0')."
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
}

variable "allowed_ip_address" {
  description = "The IP address of the verification agent that needs access to the SQL Server."
  type        = string
}

variable "name_prefix" {
  description = "A prefix to use for naming resources."
  type        = string
}

variable "db_username" {
  description = "The username for the SQL Database administrator."
  type        = string
}

variable "sql_server_firewall_rule_name_specified" {
  description = "The name of the firewall rule to create for the SQL Server."
  type        = string

}