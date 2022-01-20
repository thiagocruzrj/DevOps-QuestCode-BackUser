provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-scan"
  location = "brazilsouth"
}

resource "azurerm_app_service_plan" "plan" {
  name                = "appplanscan"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  sku {
    size = "F1"
    tier = "Standard"
  }
}

resource "azurerm_app_service" "appservice" {
  name                = "appservicescantf"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.plan.id
  http_only           = true
  client_cert_enabled = true
  detailed_error_messages_enabled = true
  ftps_state = "FtpsOnly"
  site_config {
    http2_enabled            = true
    min_tls_version          = "1.2"
    allowed_origins          = ["192.0.0.1"]
    remote_debugging_enabled = false
    php_version              = "7.4"
    python_version           = "3.4"
    dotnet_framework_version = "v4.0"
    java_version = "11"
  }

  logs {       
    failed_request_tracing_enabled = true
  }

  auth_settings {
    enabled = true
  }

  identity {
    type = "SystemAssigned"
  }
}