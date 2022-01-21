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