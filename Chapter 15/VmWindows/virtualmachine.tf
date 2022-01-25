provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-vmwindowsserver"
  location = "brazilsouth"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "vminserver-vnet"
  address_space       = ["10.0.0.0/16", "192.168.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}