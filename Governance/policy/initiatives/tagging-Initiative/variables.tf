variable "MgmtGroupName" {
    type = string
    description = "Management Group Name to create the Initiatives against."
}

variable "EnforceTags-CloudMaturityLevel" {
  type        = string
  description = "PolicyID for the EnforceTags-CloudMaturityLevel policy"
}
variable "EnforceTags-CostCenter" {
  type        = string
  description = "PolicyID for the EnforceTags-CostCenter policy"
}
variable "EnforceTags-DisasterRecoveryServiceTier" {
  type        = string
  description = "PolicyID for the EnforceTags-DisasterRecoveryServiceTier policy"
}
variable "EnforceTags-Environment" {
  type        = string
  description = "PolicyID for the EnforceTags-Environment policy"
}
variable "EnforceTags-ResourceID" {
  type        = string
  description = "PolicyID for the EnforceTags-ResourceID policy"
}