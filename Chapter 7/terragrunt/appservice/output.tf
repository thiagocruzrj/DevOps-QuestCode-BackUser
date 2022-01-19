output "url" {
  value = azurerm_app_Service.appservice.default_site_hostname
}