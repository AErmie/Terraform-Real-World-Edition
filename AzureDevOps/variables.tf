# Azure DevOps project properties: 
variable "ADOProjectName" {
    type = string
    description = "Azure DevOps project name"
}
variable "ADOProjectDescription" {
    type = string
    description = "Azure DevOps project descrpition"
}
variable "ADOProjectVisibility" {
    type = string
    default = "private"
    description = "Controls if the Azure DevOps project is 'public' or 'private'."
}
variable "ADOVersionControl" {
    type = string
    description = "Specifies the version control system. Valid values: Git or Tfvc."
}
variable "ADOWorkItemTemplate" {
    type = string
    description = "Specifies the work item template. Defaults to Agile. Valid values: Agile, Basic, CMMI, Scrum"
}
#ADO Project Features
variable "ADOFeature_Boards" {
    type = string
    description = " Defines the status (enabled, disabled) of the project features."
}
variable "ADOFeature_Repositories" {
    type = string
    description = " Defines the status (enabled, disabled) of the project features."
}
variable "ADOFeature_Pipelines" {
    type = string
    description = " Defines the status (enabled, disabled) of the project features."
}
variable "ADOFeature_TestPlans" {
    type = string
    description = " Defines the status (enabled, disabled) of the project features."
}
variable "ADOFeature_Artifacts" {
    type = string
    description = " Defines the status (enabled, disabled) of the project features."
}

# Azure DevOps repository properties: 
variable "ADONewRepoName" {
    type = string
    description = "The name of the git repository."
}

# Azure DevOps service endpoint properties: 
variable "ADOServiceEndpointName" {
    type = string
    description = "The Service Endpoint name."
}
variable "AzureSubscriptionName" {
    type = string
    description = "The name of the Azure subscription."
}

# Azure DevOps variable properties: 
variable "ADOVariableGroup_WithKeyVault_Name" {
    type = string
    description = "The name of the Variable Group."
}
variable "ADOVariableGroup_WithKeyVault_Description" {
    type = string
    description = "The description of the Variable Group."
}
variable "ADOVariableGroup_WithKeyVault_AllowAccessToAllPipelines" {
    type = bool
    description = "Boolean that indicate if this variable group is shared by all pipelines of this project."
}

variable "ADOVariableGroup_WithoutKeyVault_Name" {
    type = string
    description = "The name of the Variable Group."
}
variable "ADOVariableGroup_WithoutKeyVault_Description" {
    type = string
    description = "The description of the Variable Group."
}
variable "ADOVariableGroup_WithoutKeyVault_AllowAccessToAllPipelines" {
    type = bool
    description = "Boolean that indicate if this variable group is shared by all pipelines of this project."
}

# Azure DevOps SPN properties: 
variable "AzureAD_ApplicationName" {
    type = string
    description = "The display name for the application."
}
variable "AzureAD_SPN_Password_Expiry" {
    type = string
    description = "The End Date which the Password is valid until, formatted as a RFC3339 date string (e.g. 2018-01-01T01:02:03Z)."
}
