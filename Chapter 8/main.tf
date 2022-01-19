provider "azurerm"{
    features{}
}

resource "azurerm_resource_group" "rg"{
  name = "rg-terraform-import"
  location = "brazilsouth"
  tags = {
    "environment" = "training"
  }
}

resource "azurerm_virtual_network" "vnet"{
    name = "vnet-import"
    resource_group_name = "rg-terraform-import"
    location = "brazilsouth"
    address_space = [ "10.0.0.0/16", "192.168.0.0/16" ]
    tags = {
        "environment" = "tests"
    }
}

resource "azurerm_network_security_group" "nsg" {
  
}