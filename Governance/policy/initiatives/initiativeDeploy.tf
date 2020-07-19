module "taggingInitiative" {
  source = "./tagging-Initiative"
  MgmtGroupID = "${data.azurerm_management_group.Parent.group_id}"
  EnforceTags-CloudMaturityLevel = "${data.azurerm_policy_definition.EnforceTags-CloudMaturityLevel.display_name}"
  EnforceTags-CostCenter = "${data.azurerm_policy_definition.EnforceTags-CostCenter.display_name}"
  EnforceTags-DisasterRecoveryServiceTier = "${data.azurerm_policy_definition.EnforceTags-DisasterRecoveryServiceTier.display_name}"
  EnforceTags-Environment = "${data.azurerm_policy_definition.EnforceTags-Environment.display_name}"
  EnforceTags-ResourceID = "${data.azurerm_policy_definition.EnforceTags-ResourceID.display_name}"
}