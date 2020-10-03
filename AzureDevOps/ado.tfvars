# Azure DevOps project settings:
ADOProjectName          = "TF Real-World Examples Project"
ADOProjectDescription   = "Example ADO project with real-world scenarios."
ADOProjectVisibility    = "private"
ADOVersionControl       = "Git"
ADOWorkItemTemplate     = "Agile"
ADOFeature_Boards       = "enabled"
ADOFeature_Repositories = "enabled"
ADOFeature_Pipelines    = "enabled"
ADOFeature_TestPlans    = "enabled"
ADOFeature_Artifacts    = "enabled"

# Azure DevOps repository settings: 
ADONewRepoName = "ADO Native Repo"

# Azure DevOps service endpoint settings:
ADOServiceEndpointName = "Azure Service Connection"
AzureSubscriptionName  = "Visual Studio Enterprise"

# Azure DevOps variable settings:
ADOVariableGroup_WithKeyVault_Name                      = "Terraform Sensitive Variables"
ADOVariableGroup_WithKeyVault_Description               = "This Variable Group should be linked to an Azure Key Vault"
ADOVariableGroup_WithKeyVault_AllowAccessToAllPipelines = true

ADOVariableGroup_WithoutKeyVault_Name                      = "Terraform Pipeline Variables"
ADOVariableGroup_WithoutKeyVault_Description               = "Additional variables used with the Pipelines, but not kept in Azure Key Vault"
ADOVariableGroup_WithoutKeyVault_AllowAccessToAllPipelines = true

# AzureAD SPN settings: 
AzureAD_ApplicationName     = "ADO-Terraform-App"
AzureAD_SPN_Password_Expiry = "2021-01-01T00:00:00Z"

# Azure Key Vault properties: 
AzureKeyVault_ResourceGroup_Name           = "AzureDevOpsRG"
AzureKeyVault_ResourceGroup_Location       = "Canada Central"
AzureKeyVault_EnabledForDeployment         = true
AzureKeyVault_EnabledForDiskEncryption     = true
AzureKeyVault_EnabledForTemplateDeployment = true
AzureKeyVault_SoftDeleteEnabled            = true
AzureKeyVault_PurgeProtectionEnabled       = false
AzureKeyVault_SKUName                      = "standard"
AzureKeyVault_NetworkACLS_DefaultAction    = "Allow" # NOTE: Default action should be 'Deny', but using Allow to read from local command-line
AzureKeyVault_NetworkACLS_Bypass           = "AzureServices"

AzureKeyVault_Secret_SASKey = "Q9T0wlx79c5BBAIEoLbmgkie74+wG2DigW6gOyeEhdvTsW9FJMyM2LHXEovSjgw9L7WxkkAbP4fcWe/DDUiNcg=="
