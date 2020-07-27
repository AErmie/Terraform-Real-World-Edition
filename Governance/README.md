# Azure Governance

The Azure Governance sample code deploys the following:

- Two (2) Management Groups (MGs) in a Parent-Child hierarchy
  - Associates an Azure Subscription with the Child Management Group
- Nine (9) Azure Policy Definitions
  - Baseline Policies:
    - Allowed Locations
    - Allowed Virtual Machine (VM) SKUs
    - Audit Resource Group (RG) Resource Locks
    - Restrict Classic Resource deployments
  - Tagging Policies:
    - Enforce 'Cloud Maturity Level' tag
    - Enforce 'Cost Center' tag
    - Enforce 'Disaster Recovery Service Tier' tag
    - Enforce 'Environment' tag
    - Enforce 'Resource ID' tag
- One (1) Policy Initiative
  - Tagging (includes all Tagging policies previously listed)
- Two (2) policy assignment executions
  - Baseline policy assignment (assigns all Baseline policies previously listed individually)
  - Initiative policy assignment (assigns the Tagging policy initiatie previously listed)

## **Management Group Code Usage Example**

From the root of the .\Governance\ManagementGroups directory...

```bash
az account login

terraform init

terraform plan -var-file='MgmtGroups.tfvars'

terraform apply -var-file='MgmtGroups.tfvars' -auto-approve
```

## **Policy Code Usage Example**

From the root of the .\Governance\Policy directory...

```bash
az account login

terraform init

terraform plan

terraform apply -auto-approve
```
