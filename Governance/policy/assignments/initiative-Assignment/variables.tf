variable "MgmtGroupID" {
  type        = "string"
  description = "This is the Management Group ID that you want to hold the Policy definitions. These should be held in the Parent Management Group."
}

variable "Initiative-EnforceTags-ID" {
  type        = "string"
  description = "PolicyID for the Enforce Tags initiative"
}