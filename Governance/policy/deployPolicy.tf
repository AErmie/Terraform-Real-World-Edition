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