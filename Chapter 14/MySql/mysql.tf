provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-mysqldatabase"
  location = "brazilsouth"
}

resource "azurerm_mysql_server" "mysqlserver" {
  name                = "mssqlservertrainingtf"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  sku_name   = "B_Gen5_2"
  storage_mb = 5120

  version                      = "5.7"
  backup_retention_days        = 7
  geo_redundant_backup_enabled = false
  administrator_login          = "adminstratormysqlserver"
  administrator_login_password = "thisisNotMyP@$$word"

  infrastructure_encryption_enabled = false
  ssl_enforcement_enabled           = false
  public_network_access_enabled     = true
  auto_grow_enabled                 = true
}