output "Policy-DefinitionID" {
  value = [
    azurerm_policy_definition.EnforceTags-Environment.id,
    azurerm_policy_definition.EnforceTags-ResourceID.id,
    azurerm_policy_definition.EnforceTags-CostCenter.id,
    azurerm_policy_definition.EnforceTags-DisasterRecoveryServiceTier.id,
    azurerm_policy_definition.EnforceTags-CloudMaturityLevel.id
  ]
}
output "Policy-Name" {
  value = [
    azurerm_policy_definition.EnforceTags-Environment.name,
    azurerm_policy_definition.EnforceTags-ResourceID.name,
    azurerm_policy_definition.EnforceTags-CostCenter.name,
    azurerm_policy_definition.EnforceTags-DisasterRecoveryServiceTier.name,
    azurerm_policy_definition.EnforceTags-CloudMaturityLevel.id
  ]
}
output "Policy-PolicyType" {
  value = [
    azurerm_policy_definition.EnforceTags-Environment.policy_type,
    azurerm_policy_definition.EnforceTags-ResourceID.policy_type,
    azurerm_policy_definition.EnforceTags-CostCenter.policy_type,
    azurerm_policy_definition.EnforceTags-DisasterRecoveryServiceTier.policy_type,
    azurerm_policy_definition.EnforceTags-CloudMaturityLevel.id
  ]
}
output "Policy-ManagementGroup" {
  value = [
    azurerm_policy_definition.EnforceTags-Environment.management_group_id,
    azurerm_policy_definition.EnforceTags-ResourceID.management_group_id,
    azurerm_policy_definition.EnforceTags-CostCenter.management_group_id,
    azurerm_policy_definition.EnforceTags-DisasterRecoveryServiceTier.management_group_id,
    azurerm_policy_definition.EnforceTags-CloudMaturityLevel.id
  ]
}