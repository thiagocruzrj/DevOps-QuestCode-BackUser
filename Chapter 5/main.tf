provider "azurerm"{
    features{

    }
}

resource "azurerm_resource_group" "group-resource-chapter5"{
    count = 6
    location = "brazilsouth"
    name = "rg-terraform-chp5-${count.index}"
    tags = {
        data = formatdate("DD MM YYYY hh:mm ZZZ", timestamp())
        environment = lower("Homologação")
        owner = upper("Thiago Cruz")
        technology = title("terraform")
    }
}

variable "vnetips" {
    type = list
    default = ["10.0.0.0/8"]
}

resource "azurerm_virtual_network" "vnet"{
    name = "vnetazuretraining"
    location = "brazilsouth"
    resource_group_name = "rg-terraform-chp5-1"
    address_space = length(var.vnetips) == 0 ? ["10.0.0.0/16", "192.168.0.0/16"] : var.vnetips
}

output "vnet-amoutips"{
    value = length("${azurerm_virtual_network.vnet.address_space}")
}