resource "azurerm_databricks_workspace" "AppDataBricks" {
  name                = "${var.Environment}-${var.AppName}001"
  resource_group_name = azurerm_resource_group.AppResourceGroup.name
  location            = azurerm_resource_group.AppResourceGroup.location
  sku                 = "standard"
  tags = {
    Environment = var.Environment
    CreatedBy = "Terraform"
  }
}