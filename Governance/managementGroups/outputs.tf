output "ParentMG-Name" {
  value = azurerm_management_group.ParentMG.display_name
}
output "ParentMG-ID" {
  value = azurerm_management_group.ParentMG.id
}
output "ParentMG-GroupID" {
  value = azurerm_management_group.ParentMG.group_id
}


output "ChildMG-Name" {
  value = azurerm_management_group.ChildMG.display_name
}
output "ChildMG-ID" {
  value = azurerm_management_group.ChildMG.id
}
output "ChildMG-GroupID" {
  value = azurerm_management_group.ChildMG.group_id
}