variable "location" {
    type = string
    description = "Locale of Azure resources. Ex: brazilsouth"
    default = "brazilsouth"
}

variable "tags"{
    type = map
    description = "Tag on Azure Resources and Services"
    default = {
        environment = "development"
        responsable = "Thiago Cruz"
    }
}