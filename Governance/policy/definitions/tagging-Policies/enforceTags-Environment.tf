resource "azurerm_policy_definition" "EnforceTags_Environment" {
  name                = "DEMO-Policy-AllResources-EnforceTags-Environment"
  policy_type         = "Custom"
  mode                = "Indexed"
  display_name        = "DEMO-Policy-AllResources-EnforceTags-Environment"
  description         = "Enforce tagging requirements; specifically for the Environment tag."
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
        "defaultValue": "Environment",
        "allowedValues": [
          "Environment"
        ],
        "metadata": {
          "displayName": "Environment Tag",
          "description": "Name of the tag, in this case Environment."
        }
      },
      "tagValue": {
        "type": "Array",
        "allowedValues": [
          "Production",
          "NonProdction",
          "Core",
          "Test"
        ],
        "metadata": {
          "displayName": "Environment Tag Value",
          "description": "Value of the tag, restricted to the allowed values list."
        }
      }  
    }
PARAMETERS
}