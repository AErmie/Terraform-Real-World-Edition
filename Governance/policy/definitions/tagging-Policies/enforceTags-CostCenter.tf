resource "azurerm_policy_definition" "EnforceTags-CostCenter" {
  name                = "DEMO-Policy-AllResources-EnforceTags-CostCenter"
  policy_type         = "Custom"
  mode                = "Indexed"
  display_name        = "DEMO-Policy-AllResources-EnforceTags-CostCenter"
  description         = "Enforce tagging requirements; specifically for the CostCenter tag."
  management_group_name = var.MgmtGroupName
  metadata = <<META
  {
    "category": "DEMO-Custom"
  }
META
  policy_rule = <<POLICY_RULE
    {
      "if": {
        "not": {
          "field": "[concat('tags[', parameters('tagName'), ']')]",
          "equals": "[parameters('tagValue')]"
        }
      },
      "then": {
        "effect": "deny"
      }
    }
POLICY_RULE
  parameters = <<PARAMETERS
    {
      "tagName": {
        "type": "String",
        "defaultValue": "CostCenter",
        "allowedValues": [
          "CostCenter"
        ],
        "metadata": {
          "displayName": "Cost Center Tag",
          "description": "Name of the tag, in this case CostCenter."
        }
      },
      "tagValue": {
        "type": "String",
        "defaultValue": "0000",
        "metadata": {
          "displayName": "Cost Center Tag Value",
          "description": "Value of the tag, restricted to the allowed values list."
        }
      }
    }
PARAMETERS
}