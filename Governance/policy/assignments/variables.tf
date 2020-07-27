variable "MgmtGroupName" {
    type = string
    description = "Management Group Name to create the Policies against."
}
variable "SubscriptionID" {
    type = string
    description = "Subscription ID to create the Policies against."
}

variable "PolicyDef_AllowedLocations_ID" {
  type        = string
  description = "PolicyID for the AllowedLocations policy"
}
variable "PolicyDef_AllowedVMSKUs_ID" {
  type        = string
  description = "PolicyID for the AllowedVMSKUs policy"
}
variable "PolicyDef_AuditResourceGroupLocks_ID" {
  type        = string
  description = "PolicyID for the AuditResourceGroupLocks policy"
}
variable "PolicyDef_RestrictClassicResources_ID" {
  type        = string
  description = "PolicyID for the RestrictClassicResources policy"
}


variable "PolicyInitiative_TaggingInitiative_ID" {
  type        = string
  description = "PolicyID for the Tagging initiative policy"
}