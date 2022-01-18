terraform {
  backend "azurerm"{
      resource_group_name = "terraformstate"
      storage_account_name = "terraformstateaztraining"
      container_name = "terraformstate"
      key = "l/wg1qZkuNBpo5EjAy20fBzw93OKJQI0KuYJHrXtVijzsPtF74QjewTtRRItELkAQHCbBTum3iKbGW3BxTOGIg=="
  }
}

provider "azurerm" {
  features{

  }
}

resource "azurerm_resource_group" "rg-state" {
    name = "rg_terraform_com_state"
    location = "brazilsouth"
}