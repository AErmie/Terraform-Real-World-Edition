module "baselineAssignment" {
  source = "./baseline-Assignment"
  MgmtGroupName = var.MgmtGroupName
  SubscriptionID = var.SubscriptionID

  PolicyDef_AllowedLocations_ID = var.PolicyDef_AllowedLocations_ID
  PolicyDef_AllowedVMSKUs_ID = var.PolicyDef_AllowedVMSKUs_ID
  PolicyDef_AuditResourceGroupLocks_ID = var.PolicyDef_AuditResourceGroupLocks_ID
  PolicyDef_RestrictClassicResources_ID = var.PolicyDef_RestrictClassicResources_ID
}

# module "initiativeAssignment" {
#   source = "./initiative-Assignment"
#   MgmtGroupName = var.MgmtGroupName
#   # Initiative-EnforceTags-ID = "${data.azurerm_policy_set_definition.Initiative-Tagging-ID.id}"
#   Initiative-EnforceTags-ID = "/providers/Microsoft.Management/managementgroups/${data.azurerm_management_group.Parent.group_id}/providers/Microsoft.Authorization/policySetDefinitions/AE-Initiative-AllResources-EnforceTags"
# }