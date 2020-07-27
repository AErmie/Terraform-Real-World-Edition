module "PolicyDefinitions" {
  source = "./Definitions/"
  MgmtGroupName = data.terraform_remote_state.MgmtGroup.outputs.ChildMgmtGroup_Name
}

module "PolicyInitiative" {
  source = "./Initiatives/"
  MgmtGroupName = data.terraform_remote_state.MgmtGroup.outputs.ChildMgmtGroup_Name
  
  PolicyDef_EnforceTags_CloudMaturityLevel_ID = module.PolicyDefinitions.PolicyDef_EnforceTags_CloudMaturityLevel_ID
  PolicyDef_EnforceTags_CostCenter_ID = module.PolicyDefinitions.PolicyDef_EnforceTags_CostCenter_ID
  PolicyDef_EnforceTags_DisasterRecoveryServiceTier_ID = module.PolicyDefinitions.PolicyDef_EnforceTags_DisasterRecoveryServiceTier_ID
  PolicyDef_EnforceTags_Environment_ID = module.PolicyDefinitions.PolicyDef_EnforceTags_Environment_ID
  PolicyDef_EnforceTags_ResourceID_ID = module.PolicyDefinitions.PolicyDef_EnforceTags_ResourceID_ID
}

module "PolicyAssignment" {
  source = "./Assignments/"
  MgmtGroupName = data.terraform_remote_state.MgmtGroup.outputs.ChildMgmtGroup_Name
  SubscriptionID = data.azurerm_client_config.current.subscription_id

  PolicyDef_AllowedLocations_ID = module.PolicyDefinitions.PolicyDef_AllowedLocations_ID
  PolicyDef_AllowedVMSKUs_ID = module.PolicyDefinitions.PolicyDef_AllowedVMSKUs_ID
  PolicyDef_AuditResourceGroupLocks_ID = module.PolicyDefinitions.PolicyDef_AuditResourceGroupLocks_ID
  PolicyDef_RestrictClassicResources_ID = module.PolicyDefinitions.PolicyDef_RestrictClassicResources_ID
}