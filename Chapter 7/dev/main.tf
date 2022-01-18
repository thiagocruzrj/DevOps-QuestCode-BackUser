resource "azurerm_resource_group" "rg" {
  name = "appservice-${lower(var.environment)}"
  location = var.location
}

resource "azurerm_app_service_plan" "plan" {
  name = "azureserviceplan${lower(var.environment)}"
  location = var.location
  resource_group_name = azure_resource_group.rg.name
  sku {
      tier = "Standard"
      size = "S1"
  }
}

resource "azurerm_app_service" "appservice"{
    name = "tfappserviceem-${lower(var.environment)}"
    location = var.location
    resoucer_group_name = azurerm_resource_group.rg.name
    app_service_plan_id = azurerm_app_service_plan.plan.id

    site_config{
        dotnet_framework_version = "v4.0"
    }

    app_settings = {
        "key" = "123456"
    }
}