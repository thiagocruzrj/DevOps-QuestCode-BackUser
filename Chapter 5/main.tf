provider "azurerm"{
    features{

    }
}

resource "azurerm_resource_group" "group-resource-chapter5"{
    location = "brazilsouth"
    name = "rg-terraform-chp5"
    tags = {
        data = formatdate("DD MM YYYY hh:mm ZZZ", timestamp())
        environment = lower("Homologação")
        owner = upper("Thiago Cruz")
        technology = title("terraform")
    }
}

variable "vnetips" {
    type = list
    default = ["10.0.0.0/16"]
}

resource "azurerm_virtual_network" "vnet"{
    name = "vnetazuretraining"
    location = "brazilsouth"
    resource_group_name = "rg-terraform-chp5"
    address_space = concat(var.vnetips, [ "192.168.0.0/16" ])
}