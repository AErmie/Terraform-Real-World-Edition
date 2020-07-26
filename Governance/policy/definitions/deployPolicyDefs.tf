# Configure the Azure Provider
provider "azurerm" {
  # While version is optional, we /strongly recommend/ using it to pin the version of the Provider being used
  version = ">= 2.0.0"
  #(Optional) The Subscription ID which should be used. This can also be sourced from the ARM_SUBSCRIPTION_ID Environment Variable.
  # subscription_id = var.subscription_id
  #(Optional) The Client ID which should be used. This can also be sourced from the ARM_CLIENT_ID Environment Variable.
  # client_id       = var.client_id
  # client_secret   = var.client_secret
  #(Optional) The Tenant ID which should be used. This can also be sourced from the ARM_TENANT_ID Environment Variable.
  # tenant_id       = var.tenant_id
  #(Optional) The Cloud Environment which should be used. Possible values are public, usgovernment, german and china. Defaults to public. This can also be sourced from the ARM_ENVIRONMENT environment variable.
  environment = "public"
  features {}
}

module "baselinePolicies" {
  source = "./baseline-Policies"
  MgmtGroupName = var.MgmtGroupName
}

module "taggingPolicies" {
  source = "./tagging-Policies"
  MgmtGroupName = var.MgmtGroupName
}