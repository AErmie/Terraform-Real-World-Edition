resource "azurerm_policy_definition" "AuditResourceGroupLocks" {
  name                = "DEMO-Policy-ResourceGroups-AuditResourceLocks"
  policy_type         = "Custom"
  mode                = "All"
  display_name        = "DEMO-Policy-ResourceGroups-AuditResourceLocks"
  description         = "Audits all Resource Groups that have a specific Tag, for the CanNotDelete Resource Lock. Within this Policy, you sepcify the Tag Name and Tag Value that will be used for identifying the Resource Groups to audit."
  management_group_id = var.MgmtGroupID
  metadata = <<META
  {
    "category": "DEMO-Custom"
  }
META
  policy_rule = <<POLICY_RULE
    {
        "if": {
            "allOf": [
                {
                "field": "type",
                "equals": "Microsoft.Resources/subscriptions/resourceGroups"
                },
                {
                "field": "[concat('tags[', parameters('tagName'), ']')]",
                "equals": "[parameters('tagValue')]"
                }
            ]
        },
        "then": {
            "effect": "auditIfNotExists",
            "details": {
                "type": "Microsoft.Authorization/locks",
                "existenceCondition": {
                    "field": "Microsoft.Authorization/locks/level",
                    "equals": "CanNotDelete"
                }
            }
        }
    }
POLICY_RULE
  parameters = <<PARAMETERS
    {
        "tagName": {
            "type": "String",
                "metadata": {
                    "displayName": "Tag Name",
                    "description": "The tag namne to audit against (i.e. Environment, CostCenter, etc.)"
                }
        },
        "tagValue": {
            "type": "String",
                "metadata": {
                    "displayName": "Tag Value",
                    "description": "Value of the tag to audit against (i.e. Prod/UAT/TEST, 12345, etc.)"
                }
        }
    }
PARAMETERS
}