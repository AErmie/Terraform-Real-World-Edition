// Configuration of AzureRM service endpoint
resource "azuredevops_serviceendpoint_azurerm" "Azure_ServiceEndpoint" {
  project_id            = azuredevops_project.adoproj.id
  service_endpoint_name = var.ADOServiceEndpointName
  credentials {
    serviceprincipalid  = azuread_service_principal.ADOSPN.application_id
    serviceprincipalkey = random_password.password.result
  }
  azurerm_spn_tenantid      = data.azurerm_client_config.current.tenant_id
  azurerm_subscription_id   = data.azurerm_client_config.current.subscription_id
  azurerm_subscription_name = var.AzureSubscriptionName
}

# Make sure to set the following environment variables:
#   AZDO_PERSONAL_ACCESS_TOKEN
#   AZDO_ORG_SERVICE_URL
#   AZDO_GITHUB_SERVICE_CONNECTION_PAT

# resource "azuredevops_serviceendpoint_github" "GitHub_ServiceEndpoint" {
#   project_id            = azuredevops_project.adoproj.id
#   service_endpoint_name = "GitHub Service Connection"
#   auth_oauth {
#     oauth_configuration_id = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
#   }
# }

# resource "azuredevops_serviceendpoint_github" "GitHub_ServiceEndpoint_PAT" {
#   project_id            = azuredevops_project.adoproj.id
#   service_endpoint_name = "GithHub Personal Access Token"

#   auth_personal {
#     # Also can be set with AZDO_GITHUB_SERVICE_CONNECTION_PAT environment variable
#     personal_access_token = "something"
#   }
# }

# resource "azuredevops_serviceendpoint_github" "GitHub_ServiceEndpoint_GHApp" {
#   project_id = azuredevops_project.adoproj.id
#   service_endpoint_name = "GithHub Apps: Azure Pipelines"
#   # Note Github Apps do not support a description and will always be empty string. Must be explicty set to override the default value.
#   description = ""
# }