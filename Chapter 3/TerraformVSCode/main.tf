provider "azurerm" {
    features {
      
    }
}

resource "azurerm_resource_group" "group-resource" {
  name = "rgterraform"
  location = "brazilsouth"
}