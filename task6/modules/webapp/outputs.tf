output "app_hostname" {
    description = "Web application hostname"
    value       = azurerm_linux_web_app.main.default_hostname
}