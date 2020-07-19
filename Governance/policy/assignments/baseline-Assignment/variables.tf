variable "MgmtGroupID" {
  type        = "string"
  description = "This is the Management Group ID that you want to hold the Policy definitions. These should be held in the Parent Management Group."
}

variable "Policy-AllowedLocations-ID" {
  type        = "string"
  description = "PolicyID for the AllowedLocations policy"
}
variable "Policy-AllowedVMSKUs-ID" {
  type        = "string"
  description = "PolicyID for the AllowedVMSKUs policy"
}
variable "Policy-AuditResourceGroupLocks-ID" {
  type        = "string"
  description = "PolicyID for the AuditResourceGroupLocks policy"
}
variable "Policy-RestrictClassicResources-ID" {
  type        = "string"
  description = "PolicyID for the RestrictClassicResources policy"
}