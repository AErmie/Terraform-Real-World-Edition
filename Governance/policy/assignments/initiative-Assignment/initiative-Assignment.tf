resource "azurerm_policy_assignment" "TaggingInitiative" {
  name                 = "DEMO-TaggingInitiative"
  scope                = "/subscriptions/${var.SubscriptionID}"
  policy_definition_id = var.PolicyInitiative_TaggingInitiative_ID
  description          = "Policy Assignment to enforce Tagging requirements."
  display_name         = "DEMO-TaggingInitiative-Assignment"
  parameters = <<PARAMETERS
    {
        "CloudMaturityLevel-tagName": {
            "value": "CloudMaturityLevel"
        },
        "CloudMaturityLevel-tagValue": {
            "value": ["Cloud Ready", "Cloud Native", "Legacy"]
        },
        "CostCenter-tagName": {
            "value": "CostCenter"
        },
        "CostCenter-tagValue": {
            "value": "0000"
        },
        "DisasterRecoveryServiceTier-tagName": {
            "value": "DisasterRecoveryServiceTier"
        },
        "DisasterRecoveryServiceTier-tagValue": {
            "value": ["Tier-0", "Tier-1", "Tier-2", "Tier-3"]
        },
        "Environment-tagName": {
            "value": "Environment"
        },
        "Environment-tagValue": {
            "value": ["Production", "NonProdction", "Core", "Test"]
        },
        "ResourceID-tagName": {
            "value": "ResourceID"
        },
        "ResourceID-tagValue": {
            "value": "TBD"
        }
    }   
PARAMETERS
}