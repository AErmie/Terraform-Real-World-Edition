resource "azurerm_function_app" "function_app" {
  name                      = "FunctionApp-${var.Environment}"
  location                  = azurerm_resource_group.AppResourceGroup.location
  resource_group_name       = azurerm_resource_group.AppResourceGroup.name
  app_service_plan_id       = azurerm_app_service_plan.app_service_plan.id
  storage_account_name = azurerm_storage_account.application_storage.name
  storage_account_access_key = azurerm_storage_account.application_storage.primary_access_key

  identity {
    type = "SystemAssigned"
  }

  app_settings =  {
    WEBSITE_RUN_FROM_PACKAGE = "1"
    FUNCTIONS_WORKER_RUNTIME = "dotnet"
    # APPINSIGHTS_INSTRUMENTATIONKEY = "${data.azurerm_application_insights.ai.instrumentation_key}"
    # "ConnectionStrings:SqlConnectionStringLanding" = "@Microsoft.KeyVault(SecretUri=${data.azurerm_key_vault.kv.vault_uri}secrets/landing-database-connection-string/)"
  }
}