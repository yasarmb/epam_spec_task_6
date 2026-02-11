resource "azurerm_service_plan" "main" {
  name                = var.asp_name
  location            = var.region
  resource_group_name = var.rg_name
  os_type             = "Linux"
  sku_name            = var.app_service_plan_sku
  tags                = var.tags


}

resource "azurerm_linux_web_app" "main" {
  name                = var.app_name
  location            = var.region
  resource_group_name = var.rg_name
  service_plan_id     = azurerm_service_plan.main.id
  site_config {
    application_stack {
      dotnet_version = var.web_application_dotnet_version
    }
  }
  connection_string {
    name  = "DefaultConnection"
    type  = "SQLAzure"
    value = var.sql_connection_string
  }
  tags = var.tags
}
