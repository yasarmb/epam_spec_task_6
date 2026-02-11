variable "app_service_plan_name" {
  description = "The SKU for the App Service Plan (e.g., 'F1', 'B1', 'S1')."
  type        = string
}

variable "app_service_plan_sku" {
  description = "The SKU for the App Service Plan (e.g., 'F1', 'B1', 'S1')."
  type        = string
}

variable "web_application_name" {
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

variable "region" {
  description = "The region to deploy resources in."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group to create."
  type        = string

}

variable "sql_connection_string" {
  description = "Database connection string"
  type        = string
  sensitive   = true

}