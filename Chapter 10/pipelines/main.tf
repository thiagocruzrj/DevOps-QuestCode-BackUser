terraform {
  backend "azurerm"{ }
}

provider "azurerm"{
    features{}
}

resource "azurerm_resource_group" "rg"{
    name = "rg-terraform-pipeline-${terraform.workspace}"
    location = var.location
    tags = var.tags
}

resource "azurerm_app_service_plan" "plan"{
    name = "appplan-azpipeline-${terraform.workspace}"
    location = var.location
    tags = var.tags
    resource_group_name = azurerm_resource_group.rg.name
    sku {
        size = "F1"
        tier = "Standard"
    }
}

resource "azurerm_app_service" "appservice" {
    name = "azpipeline-tftreinamento-${terraform.workspace}"
    location = var.location
    tags = var.tags
    resource_group_name = azurerm_resource_group.rg.name
    app_service_plan_id = azurerm_app_service_plan.plan.id
}