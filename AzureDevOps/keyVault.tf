resource "azurerm_resource_group" "ADO_RG" {
  name     = "AzureDevOpsRG"
  location = "Canada Central"
}

resource "random_integer" "rndnum" {
  min     = 1
  max     = 999
}

resource "azurerm_key_vault" "ADO_KV" {
  name                        = "ADOKeyVault-Terraform-${random_integer.rndnum.result}"
  location                    = azurerm_resource_group.ADO_RG.location
  resource_group_name         = azurerm_resource_group.ADO_RG.name
  tenant_id                   = data.azurerm_client_config.current.tenant_id

  enabled_for_deployment = true
  enabled_for_disk_encryption = true
  enabled_for_template_deployment = true
  soft_delete_enabled         = true
  purge_protection_enabled    = false

  sku_name = "standard"

  network_acls {
    default_action = "Allow" #NOTE: Default action should be 'Deny'
    bypass         = "AzureServices"
  }

  tags = {
    Environment = "DevOps"
  }
}

resource "azurerm_key_vault_access_policy" "Current" {
  key_vault_id = azurerm_key_vault.ADO_KV.id
  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = data.azurerm_client_config.current.object_id

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
  tenant_id = azurerm_key_vault.ADO_KV.tenant_id
  object_id = var.ClientID

  secret_permissions = [
    "get",
    "List",
  ]
}

# resource "azurerm_key_vault_access_policy" "AzureServiceEndpoint" {
#   key_vault_id = azurerm_key_vault.ADO_KV.id
#   tenant_id = data.azurerm_client_config.current.tenant_id
#   object_id = azuredevops_serviceendpoint_azurerm.Azure_ServiceEndpoint.id

#   secret_permissions = [
#     "get",
#     "List",
#   ]
# }


resource "azurerm_key_vault_secret" "ADOKeyVault_SASKey" {
  name         = "storage-access-key"
  value        = "IU8wQRYdXQNIuqa+uWHT1ueMJBlg76g2cg2tV9CEJhZC8ZqItIS1tvC1p00tkIM75VI+rSw/irZtaUGu3tyb5A=="
  key_vault_id = azurerm_key_vault.ADO_KV.id

  tags = {
    Environment = "DevOps"
  }
}
resource "azurerm_key_vault_secret" "ADOKeyVault_SPNPwd" {
  name         = "spn-password"
  value        = "8Ilxgf-hl~N~X~_aMf5I0GFka-c2MkSPr0"
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