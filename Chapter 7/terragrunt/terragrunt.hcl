remote_state {
    backend = "azurerm"
    config = {
      resource_group_name = "terraformstate"
      storage_account_name = "terraformstateaztraining"
      container_name = "terraformstate"
      key = "7zG83TsWzO+H1TpqUBkX8KPDhRV8KCiSeE13fo1xb6wn5sBHbZEPmV6GuwankoUETLO4duVWVHikvMUxeLofqQ=="
    }
}

inputs = {
    location = "brazilsouth"
    rg = "terraformstate"
}