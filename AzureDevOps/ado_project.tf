resource "azuredevops_project" "adoproj" {
  project_name       = "${var.ADOProjectName}-${random_integer.rndnum.result}"
  description        = var.ADOProjectDescription
  visibility         = var.ADOProjectVisibility
  version_control    = var.ADOVersionControl
  work_item_template = var.ADOWorkItemTemplate
  features = {
    "boards"       = var.ADOFeature_Boards
    "repositories" = var.ADOFeature_Repositories
    "pipelines"    = var.ADOFeature_Pipelines
    "testplans"    = var.ADOFeature_TestPlans
    "artifacts"    = var.ADOFeature_Artifacts
  }
}

#Either method (ie. inline or as a separate resource, will work)
# resource "azuredevops_project_features" "my-project-features" {
#   project_id = azuredevops_project.adoproj.id
#   features = {
#       "boards" = "enabled"
#       "repositories" = "enabled"
#       "pipelines" = "enabled"
#       "testplans" = "enabled"
#       "artifacts" = "enabled"
#   }
# }