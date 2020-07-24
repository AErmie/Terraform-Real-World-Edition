#Project outputs
output "ADOProjectID" {
  value = azuredevops_project.adoproj.id
}
output "ADOProjectName" {
  value = azuredevops_project.adoproj.project_name
}
output "ADOProjectVisability" {
  value = azuredevops_project.adoproj.visibility
}
output "ADOProjectVersionControl" {
  value = azuredevops_project.adoproj.version_control
}
output "ADOProjectWorkItemTemplate" {
  value = azuredevops_project.adoproj.work_item_template
}
output "ADOProjectFeatures" {
  value = azuredevops_project.adoproj.features
}

#Repo outputs
output "ADORepoID" {
  value = azuredevops_git_repository.new_repo.id
}
output "ADORepoDefaultBranch" {
  value = azuredevops_git_repository.new_repo.default_branch
}
output "ADORepoIsFork" {
  value = azuredevops_git_repository.new_repo.is_fork
}
output "ADORepoRemoteURL" {
  value = azuredevops_git_repository.new_repo.remote_url
}
output "ADORepoSize" {
  value = azuredevops_git_repository.new_repo.size
}
output "ADORepoSSHURL" {
  value = azuredevops_git_repository.new_repo.ssh_url
}
output "ADORepoURL" {
  value = azuredevops_git_repository.new_repo.url
}
output "ADORepoWebURL" {
  value = azuredevops_git_repository.new_repo.web_url
}

#Pipeline outputs
output "ADOPipelineName-Hub" {
  value = azuredevops_build_definition.HubDeployPipeline.name
}
output "ADOPipelineID-Hub" {
  value = azuredevops_build_definition.HubDeployPipeline.id
}
output "ADOPipelineName-Spoke" {
  value = azuredevops_build_definition.SpokeDeployPipeline.name
}
output "ADOPipelineID-Spoke" {
  value = azuredevops_build_definition.SpokeDeployPipeline.id
}
output "ADOPipelineName-Peering" {
  value = azuredevops_build_definition.PeeringDeployPipeline.name
}
output "ADOPipelineID-Peering" {
  value = azuredevops_build_definition.PeeringDeployPipeline.id
}

#Variable Group outputs
output "ADOVariableGroupName" {
  value = azuredevops_variable_group.varGroup.name
}
output "ADOVariableGroupID" {
  value = azuredevops_variable_group.varGroup.id
}