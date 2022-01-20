variable "location"{
    type = string
    default = "brazilsouth"
}

variable "tags" {
  type = map
  default = {
      "environment" = "training"
      "continuosIntragion" = "actived"
      "continuosDelivery" = "actived"
  }
}
