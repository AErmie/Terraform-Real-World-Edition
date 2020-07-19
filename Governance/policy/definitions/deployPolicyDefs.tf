provider "azurerm" {
  #version         = "1.22.1"
  environment = "public"
}

module "baselinePolicies" {
  source = "./baseline-Policies"
  MgmtGroupID = data.azurerm_management_group.Parent.group_id
}

module "taggingPolicies" {
  source = "./tagging-Policies"
  MgmtGroupID = data.azurerm_management_group.Parent.group_id
}

# NOTE: The BCDR policies, specifically the Backup Audit policy, requires the RSV Resource Group Name.
# Also, the Backup Audit policy is a pre-release policy from the Azure Backup team, not public yet (or supported)
# Recommend not deploying the BCDR policies until the Backup Audit policy is public/supported (as it might change)
# module "bcdrPolicies" {
#   source = "./BCDR-Policies"
#   MgmtGroupID = data.azurerm_management_group.Parent.group_id
#   # RSV-ResourceGroup-Name = "NAME_OF_RSV_RESOURCe_GROUP"
# }