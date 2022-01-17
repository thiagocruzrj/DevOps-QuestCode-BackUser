variable "name-rg" {
    type = string
    description = "Resource group name"
    default = "rg-variables"
}

variable "location" {
    type = string
    description = "Locale of Azure resources. Ex: brazilsouth"
    default = "eastus"
}

variable "tags"{
    type = map
    description = "Tag on Azure Resources and Services"
    default = {
        environment = "development"
        responsable = "Thiago Cruz"
    }
}

variable "vnetaddresses"{
    type = list
    default = [ "10.0.0.0/16", "192.168.0.0/16"]
}