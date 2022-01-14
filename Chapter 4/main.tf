provider "azurerm" {
    features {
    }
}

variable "location" {
    type = string
    description = "Locale of Azure resources. Ex: brazilsouth"
}

resource "azurerm_resource_group" "resource-group" {
    name = "rg-variables"
    location = var.location
}