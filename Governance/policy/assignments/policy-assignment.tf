module "baselineAssignment" {
  source = "./baseline-Assignment"
  MgmtGroupID = "${data.azurerm_management_group.Parent.id}"

  Policy-AllowedLocations-ID = "${data.azurerm_policy_definition.Policy-AllowedLocations-ID.id}"
  Policy-AllowedVMSKUs-ID = "${data.azurerm_policy_definition.Policy-AllowedVMSKUs-ID.id}"
  Policy-AuditResourceGroupLocks-ID = "${data.azurerm_policy_definition.Policy-AuditResourceGroupLocks-ID.id}"
  Policy-RestrictClassicResources-ID = "${data.azurerm_policy_definition.Policy-RestrictClassicResources-ID.id}"
}

module "initiativeAssignment" {
  source = "./initiative-Assignment"
  MgmtGroupID = "${data.azurerm_management_group.Parent.id}"
  # Initiative-EnforceTags-ID = "${data.azurerm_policy_set_definition.Initiative-Tagging-ID.id}"
  Initiative-EnforceTags-ID = "/providers/Microsoft.Management/managementgroups/${data.azurerm_management_group.Parent.group_id}/providers/Microsoft.Authorization/policySetDefinitions/AE-Initiative-AllResources-EnforceTags"
}