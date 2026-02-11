resource "azurerm_service_plan" "main" {
  name                = var.app_service_plan_name
  location            = var.region
  resource_group_name = var.resource_group_name
  os_type             = "Linux"
  sku_name            = var.app_service_plan_sku
  tags                = var.tags


}

resource "azurerm_linux_web_app" "main" {
  name                = var.web_application_name
  location            = var.region
  resource_group_name = var.resource_group_name
  service_plan_id     = azurerm_service_plan.main.id
  site_config {
    application_stack {
      dotnet_version = var.web_application_dotnet_version
    }
  }
  app_settings = {
    "ConnectionStrings:DefaultConnection" = var.sql_connection_string
  }
  tags = var.tags
}
