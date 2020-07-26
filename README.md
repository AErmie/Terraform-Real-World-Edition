# Terraform Real-World Edition

This repo contains more realistic real-world environment examples that leverage Terraform.

For example, there is a separate module codebase for deploying ...

* An Azure DevOps (ADO) project, complete with pipelines, etc.
* A hub-and-spoke (ie. shared services) network topology
* Gorvernance and compliance environment guardrails
* A set of Azure services that imitate a real-world application

## Azure DevOps

The Azure DevOps sample code deploys the following:

* An Azure DevOps (ADO) project
* A new ADO-native repository (repo), which is initialized
  * Note: This is due to a current limitation that does not allow importing an existing repo if it is marked as 'private'
* Two (2) Variable Groups
  * One that is linked to an Azure Key Vault and passes through variables for Shared Access Signature (SAS) keys, SPN password, and Virtual Machine (VM) administrator password
  * One that is **not** linked to an Azure Key Vault, but contains other variables to be used in the Pipelines (ie. Subscription ID, Application ID, Tenant ID, and Terraform State related variables)
* An Azure Key Vault which is populated with sensitve values, including the Storage Shared Access Signature (SAS) key, Service Principal Name (SPN) password, and Virtual Machine (VM) administrator password
* A Service Endpoint that allows the Azure DevOps project to connect with/to an Azure subscrption (via a designated SPN)
* A Service Principal Name (SPN), used to grant Azure DevOps required permissions in the Azure Subscription

### **Azure DevOps Code Usage Example**

From the root \AzureDevOps directory...

```bash
az account login

terraform init

terraform plan -var-file='ado.tfvars'

terraform apply -var-file='ado.tfvars' -auto-approve
```

## Hub-and-Spoke Network Topology

### Hub VNET

The network topology consists of a dedicated Azure Virtual Network (VNet) for the "Shared Services" or "Hub". Within the Hub, there are 3 Subnets:

* A VPN Gateway Subnet
  * Note: No Site-to-Site (S2S) VPN or Express Route (ER) Gateway is actually deployed, due to the length of the deployment time required (as this code is used for a quick demo).
* An Azure Firewall (AFW) Subnet, and
  * Note: Azure Firewall is not actually deployed, due to the length of the deployment time required (as this code is used for a quick demo).
* A Domain Controller Subnet
  * Note: No Virtual Machines (VMs) are actually deployed, due to the length of the deployment/configuration time required (as this code is used for a quick demo).

A signle Network Security Group (NSG) is created for the Domain Controller Subnet, and associated to it. This NSG contains some sample Network Security Rules, including:

* DNS
* LDAP
* SSL
* RPC Dynamic Ports
* Kerberos

#### **Hub VNet Code Usage Example**

From the root of the \Networking\Deployments\Network-Deployment\Hub-Deploy directory...

** NOTE: This code is actually deployed via the Azure DevOps Pipeline, so you do not need to trigger it manually at the command-line. The below code example, is just and example of manual execution for reference.

```bash
az account login

terraform init

terraform plan -var-file='Hub.tfvars' -out Hub.plan

terraform apply Hub.plan -auto-approve
```

### Spoke VNET

A separate Virtual Network (VNet) for "Production" is created. Within the Spoke VNet, there are 3 Subnets created:

* Web
* App
* Data

Each Subnet has its own Network Security Group (NSG) created and associated to it. The Web NSG contains a rule that allows any (\*) -to- port 443, the App NSG contains a rule that only accepts port 443 traffic, and the Data NSG contains a rule that allows any (\*) -to- port 1433.

#### **Spoke VNet Code Usage Example**

From the root of the \Networking\Deployments\Network-Deployment\Spoke-Deploy directory...

** NOTE: This code is actually deployed via the Azure DevOps Pipeline, so you do not need to trigger it manually at the command-line. The below code example, is just and example of manual execution for reference.

```bash
az account login

terraform init

terraform plan -var-file='Spoke.tfvars' -out Spoke.plan

terraform apply Spoke.plan -auto-approve
```

### VNet Peering

The VNet Peering code takes the Virtual Network (VNet) Name and ID for each respective VNet, and creates a Peer between them.

#### **VNet Peering Code Usage Example**

From the root of the \Networking\Deployments\Network-Deployment\Peering-Deploy directory...

** NOTE: This code is actually deployed via the Azure DevOps Pipeline, so you do not need to trigger it manually at the command-line. The below code example, is just and example of manual execution for reference.

```bash
az account login

terraform init

terraform plan -var-file='Peering.tfvars' -out Peering.plan

terraform apply Peering.plan -auto-approve
```
