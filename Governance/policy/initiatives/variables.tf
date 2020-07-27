variable "MgmtGroupName" {
    type = string
    description = "Management Group Name to create the Initiatives against."
}

variable "PolicyDef_EnforceTags_CloudMaturityLevel_ID" {
    type = string
    description = "The Policy ID for the Enforce Tags - Cloud Maturity policy."
}
variable "PolicyDef_EnforceTags_CostCenter_ID" {
    type = string
    description = "The Policy ID for the Enforce Tags - Cost Center policy."
}
variable "PolicyDef_EnforceTags_DisasterRecoveryServiceTier_ID" {
    type = string
    description = "The Policy ID for the Enforce Tags - Disaster Recovery Service Tier policy."
}
variable "PolicyDef_EnforceTags_Environment_ID" {
    type = string
    description = "The Policy ID for the Enforce Tags - Environment policy."
}
variable "PolicyDef_EnforceTags_ResourceID_ID" {
    type = string
    description = "The Policy ID for the Enforce Tags - ResourceID policy."
}