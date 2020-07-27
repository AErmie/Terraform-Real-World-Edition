resource "azurerm_app_service_plan" "app_service_plan" {
  name                = "functions-service-plan-${var.Environment}"
  location            = azurerm_resource_group.AppResourceGroup.location
  resource_group_name = azurerm_resource_group.AppResourceGroup.name
  kind                = "FunctionApp"

  sku {
    tier = "Dynamic"
    size = "Y1"
  }
}