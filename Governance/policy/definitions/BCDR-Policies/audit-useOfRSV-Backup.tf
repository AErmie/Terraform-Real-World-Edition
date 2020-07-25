#Audit any VMs that are not assigned to an RSV after provisioning
#Tested successfully
# NOTE: This policy has an error when trying to create it, something to do with the Resource Group Name
# Also note that this is a pre-release policy from the Azure Backup team, not public yet (or supported)
# resource "azurerm_policy_definition" "AuditRSV-Backup" {
#   name                = "AE-Policy-Compute-AuditRSV-Backup"
#   policy_type         = "Custom"
#   mode                = "Indexed"
#   display_name        = "AE-Policy-Compute-AuditRSV-Backup"
#   description         = "This policy audits virtual machines without disaster recovery configured."
#   management_group_id = "${var.MgmtGroupID}"
#   metadata = <<META
#   {
#     "category": "AE-Custom"
#   }
# META
#   policy_rule = <<POLICY_RULE
#     {
#       "if": {
#           "field": "type",
#           "in": [
#             "Microsoft.Compute/virtualMachines",
#             "Microsoft.ClassicCompute/virtualMachines"
#           ]
#       },
#       "then": {
#         "effect": "auditIfNotExists",
#         "details": {
#           "resourceGroupName": "[parameters('vaultResourceGroup')]",
#           "type": "Microsoft.RecoveryServices/backupprotecteditems",
#           "existenceCondition": {
#             "field": "name",
#             "like": "*"
#           }
#         }
#       }
#     }
# POLICY_RULE
#   parameters = <<PARAMETERS
#     {
# 			"vaultResourceGroup": "${var.RSV-ResourceGroup-Name}"
# 		}
# PARAMETERS
# }