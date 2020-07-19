variable "ParentMG-Name" {
  type        = "string"
  description = "This is the new top-level Management Group for all Subscriptions"
}
variable "ParentMG-SubIDs" {
  type        = "list"
  description = "List all the Azure Subscription IDs that will be associated at this Management Group level (NOT any lower-level Management Groups)."
}

variable "ChildMG-Name" {
  type        = "string"
  description = "This is the new second-level Management Group to contain all Child Subscriptions"
}
variable "ChildMG-SubIDs" {
  type        = "list"
  description = "List all the Azure Subscription IDs that will be associated at this Management Group level (NOT any lower-level Management Groups)."
}