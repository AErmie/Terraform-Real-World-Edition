resource "azurerm_data_factory" "AppDataFactory" {
  name                = "adf${var.Environment}-${var.AppName}001"
  location            = azurerm_resource_group.AppResourceGroup.location
  resource_group_name = azurerm_resource_group.AppResourceGroup.name
  identity {
    type = "SystemAssigned"
  }
  tags = {
    Environment = var.Environment
    CreatedBy = "Terraform"
  }  
}