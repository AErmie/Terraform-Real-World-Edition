resource "azurerm_key_vault" "AppKeyVault" {
  name                        = substr("${var.Environment}-AppKeyVault-${var.AppName}-001",0,24)
  location                    = azurerm_resource_group.AppResourceGroup.location
  resource_group_name         = azurerm_resource_group.AppResourceGroup.name
  tenant_id                   = data.azurerm_client_config.current.tenant_id

  enabled_for_deployment = true
  enabled_for_disk_encryption = true
  enabled_for_template_deployment = true
  soft_delete_enabled         = true
  purge_protection_enabled    = false

  sku_name = "standard"

  network_acls {
    default_action = "Allow"
    bypass         = "AzureServices"
  }

  tags = {
    Environment = var.Environment
    CreatedBy = "Terraform"
  }
}

resource "azurerm_key_vault_access_policy" "KeyVault_Current_AccessPolicy" {
  key_vault_id = azurerm_key_vault.AppKeyVault.id

    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
      "List",
      "Update",
      "Restore",
      "Backup",
      "Recover",
      "Delete",
      "Import",
      "Create",
    ]

    secret_permissions = [
      "Get",
      "List",
      "Set",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
    ]

    storage_permissions = [
      "backup",
      "delete",
      "deletesas",
      "get",
      "getsas",
      "list",
      "listsas",
      "purge",
      "recover",
      "regeneratekey",
      "restore",
      "set",
      "setsas",
      "update",
    ]

    certificate_permissions = [
      "Get",
      "List",
      "Update",
      "Create",
      "Import",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
      "ManageContacts",
      "DeleteIssuers",
      "SetIssuers",
      "ListIssuers",
      "ManageIssuers",
      "GetIssuers",
    ]
  }

  resource "azurerm_key_vault_access_policy" "KeyVault_DataFactory_AccessPolicy" {
    key_vault_id = azurerm_key_vault.AppKeyVault.id
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = azurerm_data_factory.AppDataFactory.identity.0.principal_id 

    key_permissions = [
      "get","list",
    ]

    secret_permissions = [
      "get","list",
    ]

    storage_permissions = [
      "get",
    ]
  }

# Store the Storage Account's primary connection string as a secret
 resource "azurerm_key_vault_secret" "Storage_Primary_Connection_String" {
  name         = "primary-connection-string"
  value        = azurerm_storage_account.application_storage.primary_connection_string
  key_vault_id = azurerm_key_vault.AppKeyVault.id
}