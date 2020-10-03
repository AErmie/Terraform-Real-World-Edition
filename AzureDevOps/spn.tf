resource "azuread_application" "ADOSPN" {
  name = var.AzureAD_ApplicationName
}

resource "random_string" "password" {
  length  = 32
  special = false 
  # Normally you'd want special chars, 
  # but it causes issues with the ADO pipelines and AZ login 
}
resource "random_password" "password" {
  length = 32
  special = true
  override_special = "!@#%&*-_+:?" # Removed special characters that could cause issues on a command-line (like $ or [] or {}, etc.)
}

resource "azuread_service_principal" "ADOSPN" {
  application_id = azuread_application.ADOSPN.application_id
}

resource "azuread_service_principal_password" "ADOSPN" {
  service_principal_id = azuread_service_principal.ADOSPN.id
  value                = random_password.password.result
  end_date             = var.AzureAD_SPN_Password_Expiry
}

resource "azurerm_role_assignment" "main" {
  principal_id         = azuread_service_principal.ADOSPN.id
  scope                = azurerm_key_vault.ADO_KV.id
  role_definition_name = "Contributor"
}