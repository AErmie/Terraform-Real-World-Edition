# Terraform Real-World Edition

This repo contains more realistic real-world environment examples that leverage Terraform.

For example, there is a separate module codebase for deploying ...

- An Azure DevOps (ADO) project, complete with a repo, pipelines, variable groups, etc.
- A hub-and-spoke (ie. shared services) network topology complete with VNet peering
- Governance and compliance environment guardrails, inclusive of:
  - A Parent-Child Management Group hierarchy
  - Policy definitions, initiatives, and assignments
- A set of Azure services that imitate a real-world application (PENDING)

Each respective codebase has it's own README file with additional details and instructions

- [Azure DevOps](./AzureDevOps/README.md)
- [Hub-and-Spoke](./Networking/README.md)
- [Azure Governance])(./Governance/README.md)

**DISCLAIMER:** All code examples are provided as-is. Please ensure that you read the code before deploying it, to ensure you use the approprivate values applicable to your target environment.