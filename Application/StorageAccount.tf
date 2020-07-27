resource "azurerm_storage_account" "application_storage" {
    name = lower(join("", [substr("st${var.Environment}${var.AppName}",0,16), var.Iteration]))
    resource_group_name = azurerm_resource_group.AppResourceGroup.name
    location = var.Location
    account_tier = "standard"
    account_replication_type = "GRS"
    tags = {
        Environment = var.Environment
        CreatedBy = "Terraform"
  }    
}

resource "azurerm_storage_container" "sink_container" {
  name                  = "sink"
  storage_account_name  = azurerm_storage_account.application_storage.name
  container_access_type = "private"
}

resource "azurerm_storage_container" "staging_container" {
  name                  = "staging"
  storage_account_name  = azurerm_storage_account.application_storage.name
  container_access_type = "private"
}