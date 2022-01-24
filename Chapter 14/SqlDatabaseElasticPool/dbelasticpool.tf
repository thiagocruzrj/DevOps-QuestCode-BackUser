provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-sqldatabase"
  location = "brazilsouth"
}

resource "azurerm_sql_server" "sqlserver" {
  name                = "mssqlservertrainingtf"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  version                      = "12.0"
  administrator_login          = "adminstratorsqlserver"
  administrator_login_password = "thisisNotMyP@$$word"
}

resource "azurerm_sql_elasticpool" "sqlelastic" {
  name                = "azsqlelasticpool"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  server_name         = azurerm_sql_server.sqlserver.name
  edition             = "Basic"
  dtu                 = 50
  db_dtu_min          = 0
  db_dtu_max          = 5
  pool_size           = 5000
}