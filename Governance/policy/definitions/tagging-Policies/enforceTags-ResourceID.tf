resource "azurerm_policy_definition" "EnforceTags-ResourceID" {
  name                = "DEMO-Policy-AllResources-EnforceTags-ResourceID"
  policy_type         = "Custom"
  mode                = "Indexed"
  display_name        = "DEMO-Policy-AllResources-EnforceTags-ResourceID"
  description         = "Enforce tagging requirements; specifically for the ResourceID tag."
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
        "defaultValue": "ResourceID",
        "allowedValues": [
          "ResourceID"
        ],
        "metadata": {
          "displayName": "Resource ID Tag",
          "description": "Name of the tag, in this case ResourceID."
        }
      },
      "tagValue": {
        "type": "String",
        "defaultValue": "TBD",
        "metadata": {
          "displayName": "Resource ID Tag Value",
          "description": "Value of the tag, restricted to the allowed values list."
        }
      }
    }
PARAMETERS
}