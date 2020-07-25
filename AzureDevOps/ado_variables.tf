// This section configures an Azure DevOps Variable Group
resource "azuredevops_variable_group" "varGroup" {
  project_id   = azuredevops_project.adoproj.id
  name         = var.ADOVariableGroup_WithKeyVault_Name
  description  = var.ADOVariableGroup_WithKeyVault_Description
  allow_access = var.ADOVariableGroup_WithKeyVault_AllowAccessToAllPipelines

  key_vault {
    name                = azurerm_key_vault.ADO_KV.name
    service_endpoint_id = azuredevops_serviceendpoint_azurerm.Azure_ServiceEndpoint.id
  }

  # These should come from Azure Key Vault
  variable {
    name = "storage-access-key"
  }
  variable {
    name = "spn-password"
  }
  variable {
    name = "vm-admin-pswd"
  }
}

resource "azuredevops_variable_group" "varGroupPipe" {
  project_id   = azuredevops_project.adoproj.id
  name         = var.ADOVariableGroup_WithoutKeyVault_Name
  description  = var.ADOVariableGroup_WithoutKeyVault_Description
  allow_access = var.ADOVariableGroup_WithoutKeyVault_AllowAccessToAllPipelines

  # These should be variables available to all pipelines, 
  # but not sourced from Azure Key Vault
  ## Azure environment specific variables:
  variable {
    name  = "subscription_id"
    value = "c28db86b-8ce1-4755-aa09-fc99f6e0a667"
  }
  variable {
    name  = "application_id"
    value = "cb8b3e7b-d65c-4307-aa8f-20cc1d5b3498"
  }
  variable {
    name  = "tenant_id"
    value = "b033afe0-c9e4-48f6-99d3-d00269efb830"
  }

  ## Terraform state specific variables:
  variable {
    name  = "StorageResourceGroup"
    value = "TerraformStateRG"
  }
  variable {
    name  = "StorageAccountName"
    value = "terraformstatesaae"
  }
  variable {
    name  = "ContainerName"
    value = "tfstate"
  }
}