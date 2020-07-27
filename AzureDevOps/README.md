# Azure DevOps

The Azure DevOps sample code deploys the following:

- An Azure DevOps (ADO) project
- A new ADO-native repository (repo), which is initialized
  - Note: This is due to a current limitation that does not allow importing an existing GitHub repository if the repository is marked as 'private'
- Two (2) Variable Groups
  - One that is linked to an Azure Key Vault and passes through variables for Shared Access Signature (SAS) keys, Service Principal Name (SPN) password, and Virtual Machine (VM) administrator password
  - One that is **not** linked to an Azure Key Vault, but contains other variables to be used in the Pipelines (ie. Subscription ID, Application ID, Tenant ID, and Terraform State related variables)
- An Azure Key Vault which is populated with sensitve values, including the Storage Shared Access Signature (SAS) key, Service Principal Name (SPN) password, and Virtual Machine (VM) administrator password
- A Service Endpoint that allows the Azure DevOps project to connect with/to an Azure subscrption (via a designated Service Principal Name (SPN))
- A Service Principal Name (SPN) in Azure Active Directory (Azure AD), used to grant Azure DevOps required permissions in the Azure Subscription

## **Code Usage Example**

From the root of the .\AzureDevOps directory...

```bash
az account login

terraform init

terraform plan -var-file='ado.tfvars'

terraform apply -var-file='ado.tfvars' -auto-approve
```
