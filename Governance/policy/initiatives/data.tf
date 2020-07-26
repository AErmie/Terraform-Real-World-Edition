# data "azurerm_management_group" "Parent" {
#     group_id = "5f7ba86b-12fa-4432-b9bc-39b48DEMO33199"
# }

# data "azurerm_policy_definition" "EnforceTags-CloudMaturityLevel" {
#   display_name        = "DEMO-Policy-AllResources-EnforceTags-CloudMaturityLevel"
#   management_group_id = "${data.azurerm_management_group.Parent.group_id}"
# }
# data "azurerm_policy_definition" "EnforceTags-CostCenter" {
#   display_name        = "DEMO-Policy-AllResources-EnforceTags-CostCenter"
#   management_group_id = "${data.azurerm_management_group.Parent.group_id}"
# }
# data "azurerm_policy_definition" "EnforceTags-DisasterRecoveryServiceTier" {
#   display_name        = "DEMO-Policy-AllResources-EnforceTags-DisasterRecoveryServiceTier"
#   management_group_id = "${data.azurerm_management_group.Parent.group_id}"
# }
# data "azurerm_policy_definition" "EnforceTags-Environment" {
#   display_name        = "DEMO-Policy-AllResources-EnforceTags-Environment"
#   management_group_id = "${data.azurerm_management_group.Parent.group_id}"
# }
# data "azurerm_policy_definition" "EnforceTags-ResourceID" {
#   display_name        = "DEMO-Policy-AllResources-EnforceTags-ResourceID"
#   management_group_id = "${data.azurerm_management_group.Parent.group_id}"
# }