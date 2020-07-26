variable "subscription_id" {
    description = "Subscription ID"
}
variable "client_id" {
    description = "Client ID"
}
variable "client_secret" {
    description = "Client Secret"
}
variable "tenant_id" {
    description = "Tenant ID"
}

variable "ParentMG-Name" {
  type        = string
  description = "This is the new top-level Management Group for all Subscriptions"
}
variable "ParentMG-SubIDs" {
  type        = list(string)
  description = "List all the Azure Subscription IDs that will be associated at this Management Group level (NOT any lower-level Management Groups)."
}

variable "ChildMG-Name" {
  type        = string
  description = "This is the new second-level Management Group to contain all Child Subscriptions"
}
variable "ChildMG_SubIDs" {
  type        = list(string)
  description = "List all the Azure Subscription IDs that will be associated at this Management Group level (NOT any lower-level Management Groups)."
  default = []
}