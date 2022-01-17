provider "azurerm" {
    features {
    }
}

resource "azurerm_resource_group" "resource-group" {
    name = var.name-rg
    location = var.location
    tags = var.tags
}

resource "azurerm_virtual_network" "vnet" {
    name = "vnet-terraform-course"
    resource_group_name = "${azurerm_resource_group.resource-group.name}"
    location = var.location
    address_space = var.vnetaddresses
}