resource "azuredevops_build_definition" "HubDeployPipeline" {
  project_id      = azuredevops_project.adoproj.id
  name            = "ADO-Terraform-IAC (Hub Deploy)"
  agent_pool_name = "Hosted Ubuntu 1604"
  path            = "\\BuildDefinitions"

  ci_trigger {
    use_yaml = true
  }

  variable_groups = [
    azuredevops_variable_group.varGroup.id
  ]

  repository {
    repo_type   = "TfsGit"
    repo_id     = azuredevops_git_repository.new_repo.id
    branch_name = azuredevops_git_repository.new_repo.default_branch
    yml_path    = "Deploy_Hub.yml"
  }
}

resource "azuredevops_build_definition" "SpokeDeployPipeline" {
  project_id      = azuredevops_project.adoproj.id
  name            = "ADO-Terraform-IAC (Spoke Deploy)"
  path            = "\\BuildDefinitions"
  agent_pool_name = "Hosted Ubuntu 1604"

  ci_trigger {
    use_yaml = true
  }

  variable_groups = [
    azuredevops_variable_group.varGroup.id
  ]

  repository {
    repo_type   = "TfsGit"
    repo_id     = azuredevops_git_repository.new_repo.id
    branch_name = azuredevops_git_repository.new_repo.default_branch
    yml_path    = "Deploy_Spoke.yml"
  }
}

resource "azuredevops_build_definition" "PeeringDeployPipeline" {
  project_id      = azuredevops_project.adoproj.id
  name            = "ADO-Terraform-IAC (Peering Deploy)"
  path            = "\\BuildDefinitions"
  agent_pool_name = "Hosted Ubuntu 1604"

  ci_trigger {
    use_yaml = true
  }

  variable_groups = [
    azuredevops_variable_group.varGroup.id
  ]

  repository {
    repo_type   = "TfsGit"
    repo_id     = azuredevops_git_repository.new_repo.id
    branch_name = azuredevops_git_repository.new_repo.default_branch
    yml_path    = "Deploy_Peering.yml"
  }
}