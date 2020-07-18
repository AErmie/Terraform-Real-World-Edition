/* NOTE: Terraform destroy does not work with Management Groups
 SOLUTION: You have to first 'move' any Subscriptions to another Management Group (i.e. Root Tenant MG),
  and then delete the Child MG, all the way up the chain! 
  This is only required if there are Subscriptions in the MG; empty MGs can be deleted via Terraform destroy
*/

resource "azurerm_management_group" "ParentMG" {
  display_name = var.ParentMG-Name
  subscription_ids = [var.ParentMG-SubIDs]
}

resource "azurerm_management_group" "ChildMG" {
  display_name = var.ChildMG-Name
  parent_management_group_id = azurerm_management_group.ParentMG.id
  subscription_ids           = [var.ChildMG-SubIDs]
}