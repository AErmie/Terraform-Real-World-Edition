resource "azurerm_resource_group" "ADO_RG" {
  name     = "${var.AzureKeyVault_ResourceGroup_Name}-${random_integer.rndnum.result}"
  location = var.AzureKeyVault_ResourceGroup_Location
}

resource "random_integer" "rndnum" {
  min = 1
  max = 999
}

resource "azurerm_key_vault" "ADO_KV" {
  name                = "ADOKeyVault-TF-${random_integer.rndnum.result}"
  location            = azurerm_resource_group.ADO_RG.location
  resource_group_name = azurerm_resource_group.ADO_RG.name
  tenant_id           = data.azurerm_client_config.current.tenant_id

  enabled_for_deployment          = var.AzureKeyVault_EnabledForDeployment
  enabled_for_disk_encryption     = var.AzureKeyVault_EnabledForDiskEncryption
  enabled_for_template_deployment = var.AzureKeyVault_EnabledForTemplateDeployment
  soft_delete_enabled             = var.AzureKeyVault_SoftDeleteEnabled
  purge_protection_enabled        = var.AzureKeyVault_PurgeProtectionEnabled

  sku_name = var.AzureKeyVault_SKUName

  network_acls {
    default_action = var.AzureKeyVault_NetworkACLS_DefaultAction
    bypass         = var.AzureKeyVault_NetworkACLS_Bypass
  }

  tags = {
    Environment = "DevOps"
  }
}

resource "azurerm_key_vault_access_policy" "Current" {
  key_vault_id = azurerm_key_vault.ADO_KV.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = data.azurerm_client_config.current.object_id

  #Options: backup, create, decrypt, delete, encrypt, get, import, list, purge, recover, restore, sign, unwrapKey, update, verify and wrapKey.
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

  #Options: backup, delete, get, list, purge, recover, restore and set.
  secret_permissions = [
    "Get",
    "List",
    "Set",
    "Delete",
    "Recover",
    "Backup",
    "Restore",
  ]

  #Options: backup, delete, deletesas, get, getsas, list, listsas, purge, recover, regeneratekey, restore, set, setsas and update.
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

resource "azurerm_key_vault_access_policy" "SPNAccess" {
  key_vault_id = azurerm_key_vault.ADO_KV.id
  tenant_id    = azurerm_key_vault.ADO_KV.tenant_id
  object_id    = azuread_service_principal.ADOSPN.object_id

  secret_permissions = [
    "get",
    "List",
  ]
}

## This is the storage account that holds the State files
resource "azurerm_key_vault_secret" "ADOKeyVault_SASKey" {
  name         = "storage-access-key"
  value        = var.AzureKeyVault_Secret_SASKey
  key_vault_id = azurerm_key_vault.ADO_KV.id

  tags = {
    Environment = "DevOps"
  }
}
resource "azurerm_key_vault_secret" "ADOKeyVault_SPNPwd" {
  name         = "spn-password"
  value        = azuread_service_principal_password.ADOSPN.value
  key_vault_id = azurerm_key_vault.ADO_KV.id

  tags = {
    Environment = "DevOps"
  }
}
resource "azurerm_key_vault_secret" "ADOKeyVault_VMAdminPwd" {
  name         = "vm-admin-pswd"
  value        = "P@ssw0rd1234"
  key_vault_id = azurerm_key_vault.ADO_KV.id

  tags = {
    Environment = "DevOps"
  }
}