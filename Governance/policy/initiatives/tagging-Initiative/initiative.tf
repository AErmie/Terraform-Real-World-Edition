resource "azurerm_policy_set_definition" "TaggingInitiative" {
  name         = "DEMO-Initiative-AllResources-EnforceTags"
  policy_type  = "Custom"
  display_name = "DEMO-Initiative-Tags"
  description  = "This initiative contains all of the Tagging Policies."
  management_group_name = var.MgmtGroupName
  metadata = <<META
  {
    "category": "DEMO-Custom"
  }
META
  parameters = <<PARAMETERS
    {
      "CloudMaturityLevel-tagName": {
        "type": "String",
        "defaultValue": "CloudMaturityLevel",
        "metadata": {
          "description": "Name of the tag, in this case CloudMaturityLevel."
        }
      },
      "CloudMaturityLevel-tagValue": {
        "type": "Array",
        "metadata": {
          "description": "Value of the tag, restricted to the allowed values list."
        }
      },
      "CostCenter-tagName": {
        "type": "String",
        "defaultValue": "CostCenter",
        "metadata": {
          "description": "Name of the tag, in this case CostCenter."
        }
      },
      "CostCenter-tagValue": {
        "type": "String",
        "defaultValue": "0000",
        "metadata": {
          "description": "Value of the tag, restricted to the allowed values list."
        }
      },
      "DisasterRecoveryServiceTier-tagName": {
        "type": "String",
        "defaultValue": "DisasterRecoveryServiceTier",
        "metadata": {
          "description": "Name of the tag, in this case DisasterRecoveryServiceTier."
        }
      },
      "DisasterRecoveryServiceTier-tagValue": {
        "type": "Array",
        "metadata": {
          "description": "Value of the tag, restricted to the allowed values list."
        }
      },
      "Environment-tagName": {
        "type": "String",
        "defaultValue": "Environment",
        "metadata": {
          "description": "Name of the tag, in this case Environment."
        }
      },
      "Environment-tagValue": {
        "type": "Array",
        "metadata": {
          "description": "Value of the tag, restricted to the allowed values list."
        }
      },
      "ResourceID-tagName": {
        "type": "String",
        "defaultValue": "ResourceID",
        "metadata": {
          "description": "Name of the tag, in this case ResourceID."
        }
      },
      "ResourceID-tagValue": {
        "type": "String",
        "defaultValue": "TBD",
        "metadata": {
          "description": "Value of the tag, restricted to the allowed values list."
        }
      }
    }
PARAMETERS

  policy_definition_reference {
    policy_definition_id = var.EnforceTags-CloudMaturityLevel
    parameters = {
        tagName = "[parameters('CloudMaturityLevel-tagName')]",
        tagValue = "[parameters('CloudMaturityLevel-tagValue')]"
      }
  }

  policy_definition_reference {
    policy_definition_id = var.EnforceTags-CostCenter
    parameters = {
        tagName = "[parameters('CostCenter-tagName')]",
        tagValue = "[parameters('CostCenter-tagValue')]"
      }
  }

  policy_definition_reference {
    policy_definition_id = var.EnforceTags-DisasterRecoveryServiceTier
    parameters = {
        tagName = "[parameters('DisasterRecoveryServiceTier-tagName')]",
        tagValue = "[parameters('DisasterRecoveryServiceTier-tagValue')]"
      }
  }

  policy_definition_reference {
    policy_definition_id = var.EnforceTags-Environment
    parameters = {
        tagName = "[parameters('Environment-tagName')]",
        tagValue = "[parameters('Environment-tagValue')]"
      }
  }

  policy_definition_reference {
    policy_definition_id = var.EnforceTags-ResourceID
    parameters = {
        tagName = "[parameters('ResourceID-tagName')]",
        tagValue = "[parameters('ResourceID-tagValue')]"
      }
  }
}
#   policy_definitions = <<POLICY_DEFINITIONS
#     [
#       {
#         "parameters": {
#           "tagName": {
#               "value": "[parameters('CloudMaturityLevel-tagName')]"
#           },
#           "tagValue": {
#               "value": "[parameters('CloudMaturityLevel-tagValue')]"
#           }
#         },
#         "policyDefinitionId": "/providers/Microsoft.Management/managementgroups/${var.MgmtGroupName}/providers/Microsoft.Authorization/policyDefinitions/${var.EnforceTags-CloudMaturityLevel}"
#       },
#       {
#         "parameters": {
#           "tagName": {
#               "value": "[parameters('CostCenter-tagName')]"
#           },
#           "tagValue": {
#               "value": "[parameters('CostCenter-tagValue')]"
#           }
#         },
#         "policyDefinitionId": "/providers/Microsoft.Management/managementgroups/${var.MgmtGroupName}/providers/Microsoft.Authorization/policyDefinitions/${var.EnforceTags-CostCenter}"
#       },
#       {
#         "parameters": {
#           "tagName": {
#               "value": "[parameters('DisasterRecoveryServiceTier-tagName')]"
#           },
#           "tagValue": {
#               "value": "[parameters('DisasterRecoveryServiceTier-tagValue')]"
#           }
#         },
#         "policyDefinitionId": "/providers/Microsoft.Management/managementgroups/${var.MgmtGroupName}/providers/Microsoft.Authorization/policyDefinitions/${var.EnforceTags-DisasterRecoveryServiceTier}"
#       },
#       {
#         "parameters": {
#           "tagName": {
#               "value": "[parameters('Environment-tagName')]"
#           },
#           "tagValue": {
#               "value": "[parameters('Environment-tagValue')]"
#           }
#         },
#         "policyDefinitionId": "/providers/Microsoft.Management/managementgroups/${var.MgmtGroupName}/providers/Microsoft.Authorization/policyDefinitions/${var.EnforceTags-Environment}"
#       },
#       {
#         "parameters": {
#           "tagName": {
#               "value": "[parameters('ResourceID-tagName')]"
#           },
#           "tagValue": {
#               "value": "[parameters('ResourceID-tagValue')]"
#           }
#         },
#         "policyDefinitionId": "/providers/Microsoft.Management/managementgroups/${var.MgmtGroupName}/providers/Microsoft.Authorization/policyDefinitions/${var.EnforceTags-ResourceID}"
#       }
#     ]
# POLICY_DEFINITIONS
# }