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