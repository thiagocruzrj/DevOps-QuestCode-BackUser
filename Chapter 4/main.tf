provider "azurerm" {
    features {
    }
}

resource "azurerm_resource_group" "resource-group" {
    name = "rg-variables"
    location = var.location
    tags = var.tags
}