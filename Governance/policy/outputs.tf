output "PolicyDef_AllowedLocations_ID" {
  value = module.PolicyDefinitions.PolicyDef_AllowedLocations_ID
}
output "PolicyDef_AllowedVMSKUs_ID" {
  value = module.PolicyDefinitions.PolicyDef_AllowedVMSKUs_ID
}
output "PolicyDef_AuditResourceGroupLocks_ID" {
  value = module.PolicyDefinitions.PolicyDef_AuditResourceGroupLocks_ID
}
output "PolicyDef_RestrictClassicResources_ID" {
  value = module.PolicyDefinitions.PolicyDef_RestrictClassicResources_ID
}

output "PolicyDef_EnforceTags_CloudMaturityLevel_ID" {
  value = module.PolicyDefinitions.PolicyDef_EnforceTags_CloudMaturityLevel_ID
}
output "PolicyDef_EnforceTags_CostCenter_ID" {
  value = module.PolicyDefinitions.PolicyDef_EnforceTags_CostCenter_ID
}
output "PolicyDef_EnforceTags_DisasterRecoveryServiceTier_ID" {
  value = module.PolicyDefinitions.PolicyDef_EnforceTags_DisasterRecoveryServiceTier_ID
}
output "PolicyDef_EnforceTags_Environment_ID" {
  value = module.PolicyDefinitions.PolicyDef_EnforceTags_Environment_ID
}
output "PolicyDef_EnforceTags_ResourceID_ID" {
  value = module.PolicyDefinitions.PolicyDef_EnforceTags_ResourceID_ID
}


output "PolicyInitiative_TaggingInitiative_ID" {
  value = module.PolicyInitiative.PolicyInitiative_TaggingInitiative_ID
}


output "PolicyDef_AllowedLocations_AssignmentID" {
    value = module.PolicyAssignment.PolicyDef_AllowedLocations_AssignmentID
}
output "PolicyDef_AssignAllowedVMSKUs_AssignmentID" {
    value = module.PolicyAssignment.PolicyDef_AssignAllowedVMSKUs_AssignmentID
}
output "PolicyDef_AssignAuditResourceGroupLocks_AssignmentID" {
    value = module.PolicyAssignment.PolicyDef_AssignAuditResourceGroupLocks_AssignmentID
}
output "PolicyDef_AssignRestrictClassicResources_AssignmentID" {
    value = module.PolicyAssignment.PolicyDef_AssignRestrictClassicResources_AssignmentID
}