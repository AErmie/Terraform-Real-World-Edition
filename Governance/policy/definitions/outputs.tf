output "PolicyDef_AllowedLocations_ID" {
  value = module.baselinePolicies.PolicyDef_AllowedLocations_ID
}
output "PolicyDef_AllowedVMSKUs_ID" {
  value = module.baselinePolicies.PolicyDef_AllowedVMSKUs_ID
}
output "PolicyDef_AuditResourceGroupLocks_ID" {
  value = module.baselinePolicies.PolicyDef_AuditResourceGroupLocks_ID
}
output "PolicyDef_RestrictClassicResources_ID" {
  value = module.baselinePolicies.PolicyDef_RestrictClassicResources_ID
}

output "PolicyDef_EnforceTags_CloudMaturityLevel_ID" {
  value = module.taggingPolicies.PolicyDef_EnforceTags_CloudMaturityLevel_ID
}
output "PolicyDef_EnforceTags_CostCenter_ID" {
  value = module.taggingPolicies.PolicyDef_EnforceTags_CostCenter_ID
}
output "PolicyDef_EnforceTags_DisasterRecoveryServiceTier_ID" {
  value = module.taggingPolicies.PolicyDef_EnforceTags_DisasterRecoveryServiceTier_ID
}
output "PolicyDef_EnforceTags_Environment_ID" {
  value = module.taggingPolicies.PolicyDef_EnforceTags_Environment_ID
}
output "PolicyDef_EnforceTags_ResourceID_ID" {
  value = module.taggingPolicies.PolicyDef_EnforceTags_ResourceID_ID
}