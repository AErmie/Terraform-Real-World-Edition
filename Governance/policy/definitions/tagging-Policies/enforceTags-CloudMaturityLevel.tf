resource "azurerm_policy_definition" "EnforceTags-CloudMaturityLevel" {
  name                = "DEMO-Policy-AllResources-EnforceTags-CloudMaturityLevel"
  policy_type         = "Custom"
  mode                = "Indexed"
  display_name        = "DEMO-Policy-AllResources-EnforceTags-CloudMaturityLevel"
  description         = "Enforce tagging requirements; specifically for the CloudMaturityLevel tag."
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
          "in": "[parameters('tagValue')]"
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
        "defaultValue": "CloudMaturityLevel",
        "allowedValues": [
          "CloudMaturityLevel"
        ],
        "metadata": {
          "displayName": "Cloud Maturity Level Tag",
          "description": "Name of the tag, in this case CloudMaturityLevel."
        }
      },
      "tagValue": {
        "type": "Array",
        "allowedValues": [
          "Cloud Ready",
          "Cloud Native",
          "Legacy"
        ],
        "metadata": {
          "displayName": "Cloud Maturity Level Tag Value",
          "description": "Value of the tag, restricted to the allowed values list."
        }
      }
    }
PARAMETERS
}