variable "MgmtGroupName" {
  type        = string
  description = "This is the Management Group ID that you want to hold the Policy definitions. These should be held in the Parent Management Group."
}
variable "SubscriptionID" {
  type        = string
  description = "This is the Subscription ID that you want to hold the Policy definitions. These should be held in the Parent Management Group."
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