module "taggingInitiative" {
  source = "./tagging-Initiative"
  MgmtGroupName = var.MgmtGroupName
  EnforceTags-CloudMaturityLevel = var.PolicyDef_EnforceTags_CloudMaturityLevel_ID
  EnforceTags-CostCenter = var.PolicyDef_EnforceTags_CostCenter_ID
  EnforceTags-DisasterRecoveryServiceTier = var.PolicyDef_EnforceTags_DisasterRecoveryServiceTier_ID
  EnforceTags-Environment = var.PolicyDef_EnforceTags_Environment_ID
  EnforceTags-ResourceID = var.PolicyDef_EnforceTags_ResourceID_ID
}