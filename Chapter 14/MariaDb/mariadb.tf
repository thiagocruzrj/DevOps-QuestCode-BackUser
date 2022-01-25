provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-mariadb"
  location = "brazilsouth"
}

resource "azurerm_mariadb_server" "mariadbserver" {
  name                = "mariadbservertf"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  sku_name                     = "B_Gen5_2"
  storage_mb                   = 51200
  backup_retention_days         = 7
  geo_redundant_backup_enabled = false

  administrator_login          = "adminmariadb"
  administrator_login_password = "thisIsNotMyP@$$word"
  version                      = "10.2"
  ssl_enforcement_enabled      = false
}