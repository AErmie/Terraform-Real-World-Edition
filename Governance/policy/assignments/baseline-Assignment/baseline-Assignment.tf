resource "azurerm_policy_assignment" "AssignAllowedLocations" {
  name                 = "DEMO-AllowedLocations"
  scope                = "/subscriptions/${var.SubscriptionID}"
  policy_definition_id = var.PolicyDef_AllowedLocations_ID
  description          = "Policy Assignment to restrict Resource locations."
  display_name         = "DEMO-AllowedLocations-Assignment"

  metadata = <<METADATA
    {
    "category": "DEMO-Custom"
    }
METADATA

  parameters = <<PARAMETERS
    {
        "listOfAllowedLocations": {
            "value":  ["CanadaCentral", "CanadaEast", "EastUS2", "CentralUS", "EastAsia", "SouthEastAsia", "JapanEast","JapanWest"]
        }
    }   
PARAMETERS
}

resource "azurerm_policy_assignment" "AssignAllowedVMSKUs" {
  name                 = "DEMO-AllowedVMSKUs"
  scope                = "/subscriptions/${var.SubscriptionID}"
  policy_definition_id = var.PolicyDef_AllowedVMSKUs_ID
  description          = "Policy Assignment to restrict Resource VM SKUs."
  display_name         = "DEMO-AllowedVMSKUs-Assignment"

  metadata = <<METADATA
    {
    "category": "DEMO-Custom"
    }
METADATA

  parameters = <<PARAMETERS
    {
        "listOfAllowedSKUs": {
            "value": [ "Standard_F1s", "Standard_E2s_v3", "Standard_E4s_v3", "Standard_E8s_v3", "Standard_E16s_v3", "Standard_E32-8s_v3", "Standard_E32-16_v3" ]
        }
    }   
PARAMETERS
}

resource "azurerm_policy_assignment" "AssignAuditResourceGroupLocks" {
  name                 = "DEMO-AuditRGLocks"
  scope                = "/subscriptions/${var.SubscriptionID}"
  policy_definition_id = var.PolicyDef_AuditResourceGroupLocks_ID
  description          = "Policy Assignment to audit Resource Group Delete Locks."
  display_name         = "DEMO-AuditResourceGroupLocks-Assignment"

  metadata = <<METADATA
    {
    "category": "DEMO-Custom"
    }
METADATA

  parameters = <<PARAMETERS
    {
        "tagName": {
            "value": "Environment"
        },
        "tagValue": {
            "value": "Production"
        }
    }   
PARAMETERS
}

resource "azurerm_policy_assignment" "AssignRestrictClassicResources" {
  name                 = "DEMO-RestrictClassicRes"
  scope                = "/subscriptions/${var.SubscriptionID}"
  policy_definition_id = var.PolicyDef_RestrictClassicResources_ID
  description          = "Policy Assignment to restrict the use of Classic resource types."
  display_name         = "DEMO-RestrictClassicResources-Assignment"

  metadata = <<METADATA
    {
    "category": "DEMO-Custom"
    }
METADATA

  parameters = <<PARAMETERS
    {
    }   
PARAMETERS
}