provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-traffic"
  location = "brazilsouth"
}

resource "azurerm_traffic_manager_profile" "trafficManager" {
  name                   = "trafficmanagergeo"
  resource_group_name    = azurerm_resource_group.rg.name
  traffic_routing_method = "Geographic"

  dns_config {
    relative_name = "trafficmanagergeo"
    ttl           = 100
  }

  monitor_config {
    protocol                     = "http"
    port                         = 80
    path                         = "/"
    interval_in_seconds          = 30
    timeout_in_seconds           = 9
    tolerated_number_of_failures = 4
  }
}

// Brazilian service plan
resource "azurerm_app_service_plan" "planbr"{
    name = "appplanbr"
    location = "brazilsouth"
    resource_group_name = azurerm_resource_group.rg.name

    sku {
        tier = "Standard"
        size = "S1"
    }
}

resource "azurerm_app_service" "appservicebr"{
    name = "appservicetfbr"
    location = azurerm_app_service_plan.planbr.location
    app_service_plan_id = azurerm_app_service.appservicebr.id
    resource_group_name = azurerm_resource_group.rg.name
}

// USA service plan
resource "azurerm_app_service_plan" "planus"{
    name = "appplanus"
    location = "eastus"
    resource_group_name = azurerm_resource_group.rg.name

    sku {
        tier = "Standard"
        size = "S1"
    }
}

resource "azurerm_app_service" "appserviceus"{
    name = "appservicetfus"
    location = azurerm_app_service_plan.planus.location
    app_service_plan_id = azurerm_app_service.appserviceus.id
    resource_group_name = azurerm_resource_group.rg.name
}

// Around the world service plan
resource "azurerm_app_service_plan" "planworld"{
    name = "appplanworld"
    location = "uksouth"
    resource_group_name = azurerm_resource_group.rg.name

    sku {
        tier = "Standard"
        size = "S1"
    }
}

resource "azurerm_app_service" "appserviceworld"{
    name = "appservicetfworld"
    location = azurerm_app_service_plan.planworld.location
    app_service_plan_id = azurerm_app_service.appserviceus.id
    resource_group_name = azurerm_resource_group.rg.name
}

// Endpoints
resource "azurerm_traffic_manager_endpoint" "cdnendpointbr"{
    name = "trafficbr"
    resource_group_name = azurerm_resource_group.rg.name
    profile_name = azurerm_traffic_manager_profile.trafficManager.name
    target_resource_id = azurerm_app_service.appservicebr.id
    type = "azureEndpoints"
    weight = 100
    geo_mappings = ["BR"]
}

resource "azurerm_traffic_manager_endpoint" "cdnendpointus"{
    name = "trafficus"
    resource_group_name = azurerm_resource_group.rg.name
    profile_name = azurerm_traffic_manager_profile.trafficManager.name
    target_resource_id = azurerm_app_service.appserviceus.id
    type = "azureEndpoints"
    weight = 101
    geo_mappings = ["US"]
}

resource "azurerm_traffic_manager_endpoint" "cdnendpointworld"{
    name = "trafficworld"
    resource_group_name = azurerm_resource_group.rg.name
    profile_name = azurerm_traffic_manager_profile.trafficManager.name
    target_resource_id = azurerm_app_service.appserviceworld.id
    type = "azureEndpoints"
    weight = 102
    geo_mappings = ["WORLD"]
}