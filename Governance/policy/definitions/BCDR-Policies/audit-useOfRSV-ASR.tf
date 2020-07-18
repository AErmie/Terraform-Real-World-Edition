# NOTE: Need to refine this policy to only audit of DisasterRecoveryServiceTier tag value is 'Tier-1', which has a < 4 hours RTO/RPO
# All other DisasterRecoveryServiceTier tier's (ie. Tier-0 = Active-Active, Tier-3/4 = Backup only) don't use ASR.
resource "azurerm_policy_definition" "AuditRSV-ASR" {
  name                = "AE-Policy-Compute-AuditRSV-ASR"
  policy_type         = "Custom"
  mode                = "Indexed"
  display_name        = "AE-Policy-Compute-AuditRSV-ASR"
  description         = "This policy audits virtual machines without disaster recovery configured."
  management_group_id = "${var.MgmtGroupID}"
  metadata = <<META
  {
    "category": "AE-Custom"
  }
META
  policy_rule = <<POLICY_RULE
    {
        "if": {
          "allOf": [
            {
              "field": "type",
              "in": [
                "Microsoft.Compute/virtualMachines",
                "Microsoft.ClassicCompute/virtualMachines"
              ]
            },
            {
              "field": "[concat('tags[', parameters('tagName'), ']')]",
              "in": "[parameters('tagValue')]"
            }
          ]
        },
        "then": {
            "effect": "auditIfNotExists",
            "details": {
                "type": "Microsoft.Resources/links",
                "existenceCondition": {
                    "field": "name",
                    "like": "ASR-Protect-*"
                }
            }
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
          "description": "Name of the tag to audit use of ASR, in this case DisasterRecoveryServiceTier."
        }
      },
      "tagValue": {
        "type": "Array",
        "defaultValue": ["Tier-1"],
        "allowedValues": [
          "Tier-1"
        ],
        "metadata": {
          "displayName": "Disaster Recovery Service Tier Tag Value",
          "description": "Value of the tag to audit use of ASR, in this case 'Tier-1'."
        }
      }
    }
PARAMETERS
}