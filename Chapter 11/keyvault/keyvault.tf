provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-keyvault"
  location = "brazilsouth"
}

data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "keyvault" {
  name                       = "keyvaulttfrj"
  location                   = azurerm_resource_group.rg.location
  resource_group_name        = azurerm_resource_group.rg.name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = "premium"
  soft_delete_retention_days = 7
  access_policy {
    key_permissions    = ["create", "get", "list"]
    object_id          = data.azurerm_client_config.current.object_id
    tenant_id          = data.azurerm_client_config.current.tenant_id
    secret_permissions = ["set", "get", "delete", "purge", "recover", "list"]
    certificate_permissions = [ "list" ]
  }
}