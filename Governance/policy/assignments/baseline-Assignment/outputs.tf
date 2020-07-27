output "PolicyDef_AllowedLocations_AssignmentID" {
    value = azurerm_policy_assignment.AssignAllowedLocations.id
}
output "PolicyDef_AssignAllowedVMSKUs_AssignmentID" {
    value = azurerm_policy_assignment.AssignAllowedVMSKUs.id
}
output "PolicyDef_AssignAuditResourceGroupLocks_AssignmentID" {
    value = azurerm_policy_assignment.AssignAuditResourceGroupLocks.id
}
output "PolicyDef_AssignRestrictClassicResources_AssignmentID" {
    value = azurerm_policy_assignment.AssignRestrictClassicResources.id
}