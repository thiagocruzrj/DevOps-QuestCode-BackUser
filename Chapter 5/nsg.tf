resource "azurerm_resource_group" "vnetrg"{
    location = "brazilsouth"
    name = "vnetrg"
}

resource "azurerm_network_security_group" "nsg" {
    name = "nsg-training"
    location = "brazilsouth"
    resource_group_name = "vnetrg"
    depends_on = [
      azurerm_resource_group.vnetrg
    ]
}

variable "rules_entry"{
    type = map
    description = "List of ports free on NSG"
    default = { 
        101 = 80, 
        102 = 443, 
        103 = 3389, 
        104 = 22
    }
}

resource "azurerm_network_security_rule" "rules_entry_free" {
    for_each = var.rules_entry
    resource_group_name = "vnetrg"
    name = "entryport_${each.value}"
    priority = each.key
    destination_port_range = each.value
    direction = "Inbound"
    access = "Allow"
    source_port_range = "*"
    protocol = "Tcp"
    source_address_prefix = "*"
    destination_address_prefix = "*"
    network_security_group_name = "nsg-training"
}