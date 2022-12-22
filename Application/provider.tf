terraform {
  # Specify the Terraform version for version 'pinning'. 
  required_version = ">=1.0.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.37"
    }
  }

  # Backend for configuring remote state files to Azure Storage
  backend "azurerm" {
    resource_group_name  = "TerraformStateRG"
    storage_account_name = "terraformstatesaae"
    container_name       = "tfstate"
    key                  = "application.tfstate"
  }
}

# Configure the Azure Provider
provider "azurerm" {
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