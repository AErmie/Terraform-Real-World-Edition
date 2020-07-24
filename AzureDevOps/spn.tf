# resource "azuread_application" "ADOSPN" {
#   name = format("%s-app", azuredevops_project.adoproj.project_name)
# }

# resource "random_string" "password" {
#   length  = 32
#   special = true
# }

# resource "azuread_service_principal" "ADOSPN" {
#   application_id = azuread_application.ADOSPN.application_id
# }

# resource "azuread_service_principal_password" "ADOSPN" {
#   service_principal_id = azuread_service_principal.ADOSPN.id
#   value                = random_string.password.result
#   end_date             = "2021-01-01T00:00:00Z"
# }

# resource "azurerm_role_assignment" "main" {
#   principal_id         = azuread_service_principal.ADOSPN.id
#   scope                = azurerm_key_vault.ADO_KV.id
#   role_definition_name = "Contributor"
# }