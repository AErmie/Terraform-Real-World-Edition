module "PolicyDefinitions" {
  source = "./Definitions/"
  MgmtGroupName = data.terraform_remote_state.MgmtGroup.outputs.ChildMgmtGroup_Name
}