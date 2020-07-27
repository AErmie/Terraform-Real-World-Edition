module "baselineAssignment" {
  source = "./Baseline-Assignment"
  MgmtGroupName = var.MgmtGroupName
  SubscriptionID = var.SubscriptionID

  PolicyDef_AllowedLocations_ID = var.PolicyDef_AllowedLocations_ID
  PolicyDef_AllowedVMSKUs_ID = var.PolicyDef_AllowedVMSKUs_ID
  PolicyDef_AuditResourceGroupLocks_ID = var.PolicyDef_AuditResourceGroupLocks_ID
  PolicyDef_RestrictClassicResources_ID = var.PolicyDef_RestrictClassicResources_ID
}

module "initiativeAssignment" {
  source = "./Initiative-Assignment"
  MgmtGroupName = var.MgmtGroupName
  SubscriptionID = var.SubscriptionID

  PolicyInitiative_TaggingInitiative_ID = var.PolicyInitiative_TaggingInitiative_ID
}