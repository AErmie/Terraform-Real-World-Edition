# Azure DevOps project properties: 
variable "ADOProjectName" {
  type        = string
  description = "Azure DevOps project name"
}
variable "ADOProjectDescription" {
  type        = string
  description = "Azure DevOps project descrpition"
}
variable "ADOProjectVisibility" {
  type        = string
  default     = "private"
  description = "Controls if the Azure DevOps project is 'public' or 'private'."
}
variable "ADOVersionControl" {
  type        = string
  description = "Specifies the version control system. Valid values: Git or Tfvc."
}
variable "ADOWorkItemTemplate" {
  type        = string
  description = "Specifies the work item template. Defaults to Agile. Valid values: Agile, Basic, CMMI, Scrum"
}
#ADO Project Features
variable "ADOFeature_Boards" {
  type        = string
  description = " Defines the status (enabled, disabled) of the project features."
}
variable "ADOFeature_Repositories" {
  type        = string
  description = " Defines the status (enabled, disabled) of the project features."
}
variable "ADOFeature_Pipelines" {
  type        = string
  description = " Defines the status (enabled, disabled) of the project features."
}
variable "ADOFeature_TestPlans" {
  type        = string
  description = " Defines the status (enabled, disabled) of the project features."
}
variable "ADOFeature_Artifacts" {
  type        = string
  description = " Defines the status (enabled, disabled) of the project features."
}

# Azure DevOps repository properties: 
variable "ADONewRepoName" {
  type        = string
  description = "The name of the git repository."
}

# Azure DevOps service endpoint properties: 
variable "ADOServiceEndpointName" {
  type        = string
  description = "The Service Endpoint name."
}
variable "AzureSubscriptionName" {
  type        = string
  description = "The name of the Azure subscription."
}

# Azure DevOps variable properties: 
variable "ADOVariableGroup_WithKeyVault_Name" {
  type        = string
  description = "The name of the Variable Group."
}
variable "ADOVariableGroup_WithKeyVault_Description" {
  type        = string
  description = "The description of the Variable Group."
}
variable "ADOVariableGroup_WithKeyVault_AllowAccessToAllPipelines" {
  type        = bool
  description = "Boolean that indicate if this variable group is shared by all pipelines of this project."
}

variable "ADOVariableGroup_WithoutKeyVault_Name" {
  type        = string
  description = "The name of the Variable Group."
}
variable "ADOVariableGroup_WithoutKeyVault_Description" {
  type        = string
  description = "The description of the Variable Group."
}
variable "ADOVariableGroup_WithoutKeyVault_AllowAccessToAllPipelines" {
  type        = bool
  description = "Boolean that indicate if this variable group is shared by all pipelines of this project."
}

# Azure DevOps SPN properties: 
variable "AzureAD_ApplicationName" {
  type        = string
  description = "The display name for the application."
}
variable "AzureAD_SPN_Password_Expiry" {
  type        = string
  description = "The End Date which the Password is valid until, formatted as a RFC3339 date string (e.g. 2018-01-01T01:02:03Z)."
}

# Azure Key Vault properties: 
variable "AzureKeyVault_ResourceGroup_Name" {
  type        = string
  description = "The name for the Resource Group that will contain the KeyVault."
}
variable "AzureKeyVault_ResourceGroup_Location" {
  type        = string
  description = "The lovation for the Resource Group that will contain the KeyVault."
}
variable "AzureKeyVault_EnabledForDeployment" {
  type        = bool
  description = "Boolean flag to specify whether Azure Virtual Machines are permitted to retrieve certificates stored as secrets from the key vault. Defaults to false."
}
variable "AzureKeyVault_EnabledForDiskEncryption" {
  type        = bool
  description = "Boolean flag to specify whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys. Defaults to false."
}
variable "AzureKeyVault_EnabledForTemplateDeployment" {
  type        = bool
  description = "Boolean flag to specify whether Azure Resource Manager is permitted to retrieve secrets from the key vault. Defaults to false."
}
variable "AzureKeyVault_SoftDeleteEnabled" {
  type        = bool
  description = "Should Soft Delete be enabled for this Key Vault? Defaults to false."
}
variable "AzureKeyVault_PurgeProtectionEnabled" {
  type        = bool
  description = "Is Purge Protection enabled for this Key Vault? Defaults to false."
}
variable "AzureKeyVault_SKUName" {
  type        = string
  description = "The Name of the SKU used for this Key Vault. Possible values are standard and premium."
}
variable "AzureKeyVault_NetworkACLS_DefaultAction" {
  type        = string
  description = "The Default Action to use when no rules match from ip_rules / virtual_network_subnet_ids. Possible values are Allow and Deny."
}
variable "AzureKeyVault_NetworkACLS_Bypass" {
  type        = string
  description = "Specifies which traffic can bypass the network rules. Possible values are AzureServices and None."
}