output "ParentMgmtGroup_Name" {
  value = azurerm_management_group.ParentMG.name
}
output "ParentMgmtGroup_ID" {
  value = azurerm_management_group.ParentMG.group_id
}
output "ParentMgmtGroup_DisplayName" {
  value = azurerm_management_group.ParentMG.display_name
}
output "ParentMgmtGroup_ParentID" {
  value = azurerm_management_group.ParentMG.parent_management_group_id
}
output "ParentMgmtGroup_SubscriptionIDs" {
  value = azurerm_management_group.ParentMG.subscription_ids
}


output "ChildMgmtGroup_Name" {
  value = azurerm_management_group.ChildMG.name
}
output "ChildMgmtGroup_ID" {
  value = azurerm_management_group.ChildMG.group_id
}
output "ChildMgmtGroup_DisplayName" {
  value = azurerm_management_group.ChildMG.display_name
}
output "ChildMgmtGroup_ChildID" {
  value = azurerm_management_group.ChildMG.parent_management_group_id
}
output "ChildMgmtGroup_SubscriptionIDs" {
  value = azurerm_management_group.ChildMG.subscription_ids
}