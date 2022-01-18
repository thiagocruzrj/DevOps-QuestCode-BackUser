provider "azurerm" {
  features{}
}

variable "location"{
    type = string
    default = "brazilsouth"
}

resource "azurerm_resource_group" "rg" {
  name = "appservice-rg"
  location = var.location
}