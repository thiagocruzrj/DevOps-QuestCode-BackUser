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

resource "azurerm_app_service_plan" "plan" {
  name = "azureserviceplan"
  location = var.location
  resource_group_name = azure_resource_group.rg.name
  sku {
      tier = "Standard"
      size = "S1"
  }
}

resource "azurerm_app_service" "appservice"{
    name = "tfappservicechp7"
    location = var.location
    resoucer_group_name = azurerm_resource_group.rg.name
    app_service_plan_id = azurerm_app_service_plan.plan.id

    site_config{
        dotnet_framework_version = "v4.0"
    }

    app_settings = {
        "key" = "123456"
    }

    output "url" {
        value = azurerm_app_service.appservice.default_site_hostname
    }
}