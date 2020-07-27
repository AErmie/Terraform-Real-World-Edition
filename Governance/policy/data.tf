data "terraform_remote_state" "MgmtGroup" {
  backend = "azurerm"
  config = {
    resource_group_name   = "TerraformStateRG"
    storage_account_name  = "terraformstatesaae"
    container_name        = "tfstate"
    key                   = "governance_mgmtgroups.tfstate"
  }
}

data "azurerm_client_config" "current" {}