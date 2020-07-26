resource "azurerm_policy_definition" "EnforceTags-DisasterRecoveryServiceTier" {
  name                = "DEMO-Policy-AllResources-EnforceTags-DisasterRecoveryServiceTier"
  policy_type         = "Custom"
  mode                = "Indexed"
  display_name        = "DEMO-Policy-AllResources-EnforceTags-DisasterRecoveryServiceTier"
  description         = "Enforce tagging requirements; specifically for the DisasterRecoveryServiceTier tag."
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
        "defaultValue": "DisasterRecoveryServiceTier",
        "allowedValues": [
          "DisasterRecoveryServiceTier"
        ],
        "metadata": {
          "displayName": "Disaster Recovery Service Tier Tag",
          "description": "Name of the tag, in this case DisasterRecoveryServiceTier."
        }
      },
      "tagValue": {
        "type": "Array",
        "allowedValues": [
          "Tier-0",
          "Tier-1",
          "Tier-2",
          "Tier-3"
        ],
        "metadata": {
          "displayName": "Disaster Recovery Service Tier Tag Value",
          "description": "Value of the tag, restricted to the allowed values list."
        }
      }
    }
PARAMETERS
}