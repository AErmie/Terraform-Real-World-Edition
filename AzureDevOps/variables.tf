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

