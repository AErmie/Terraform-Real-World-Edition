resource "azurerm_management_group" "ParentMG" {
  display_name = var.ParentMG-Name
  subscription_ids = var.ParentMG-SubIDs
}

resource "azurerm_management_group" "ChildMG" {
  display_name = var.ChildMG-Name
  parent_management_group_id = azurerm_management_group.ParentMG.id
  subscription_ids           = var.ChildMG_SubIDs
}