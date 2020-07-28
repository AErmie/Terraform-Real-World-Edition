output "StorageAccount_PrimaryConnectionString"{
     value = azurerm_storage_account.application_storage.primary_connection_string
 }

 output "AzureDataFactory_PrincipalID"{
     value = azurerm_data_factory.AppDataFactory.identity.0.principal_id
 }