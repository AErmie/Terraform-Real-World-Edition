output "PolicyDef_AllowedLocations_AssignmentID" {
    value = module.baselineAssignment.PolicyDef_AllowedLocations_AssignmentID
}
output "PolicyDef_AssignAllowedVMSKUs_AssignmentID" {
    value = module.baselineAssignment.PolicyDef_AssignAllowedVMSKUs_AssignmentID
}
output "PolicyDef_AssignAuditResourceGroupLocks_AssignmentID" {
    value = module.baselineAssignment.PolicyDef_AssignAuditResourceGroupLocks_AssignmentID
}
output "PolicyDef_AssignRestrictClassicResources_AssignmentID" {
    value = module.baselineAssignment.PolicyDef_AssignRestrictClassicResources_AssignmentID
}

output "PolicyInitiative_TaggingInitiative_AssignmentID" {
    value = module.initiativeAssignment.PolicyInitiative_TaggingInitiative_AssignmentID
}