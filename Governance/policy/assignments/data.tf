# data "azurerm_management_group" "Parent" {
#     group_id = "5f7ba86b-12fa-4432-b9bc-39b48ae33199"
# }

# data "azurerm_policy_definition" "Policy-AllowedLocations-ID" {
#   display_name        = "AE-Policy-Global-AllowedLocations"
#   management_group_id = "${data.azurerm_management_group.Parent.group_id}"
# }
# data "azurerm_policy_definition" "Policy-AllowedVMSKUs-ID" {
#   display_name        = "AE-Policy-Compute-AllowedVMSKUs"
#   management_group_id = "${data.azurerm_management_group.Parent.group_id}"
# }
# data "azurerm_policy_definition" "Policy-AuditResourceGroupLocks-ID" {
#   display_name        = "AE-Policy-ResourceGroups-AuditResourceLocks"
#   management_group_id = "${data.azurerm_management_group.Parent.group_id}"
# }
# data "azurerm_policy_definition" "Policy-RestrictClassicResources-ID" {
#   display_name        = "AE-Policy-Global-RestrictClassicResources"
#   management_group_id = "${data.azurerm_management_group.Parent.group_id}"
# }

# # data "azurerm_policy_set_definition" "Initiative-Tagging-ID" {
# #   display_name        = "AE-Initiative-Tags"
# #   management_group_id = "${data.azurerm_management_group.Parent.group_id}"
# # }