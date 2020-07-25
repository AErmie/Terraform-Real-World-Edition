resource "azurerm_policy_assignment" "AssignAllowedLocations" {
  name                 = "DEMO-AllowedLocations"
  scope                = var.MgmtGroupID
  policy_definition_id = var.Policy-AllowedLocations-ID
  description          = "Policy Assignment to restrict Resource locations."
  display_name         = "DEMO-AllowedLocations-Assignment"
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
  scope                = var.MgmtGroupID
  policy_definition_id = var.Policy-AllowedVMSKUs-ID
  description          = "Policy Assignment to restrict Resource VM SKUs."
  display_name         = "DEMO-AllowedVMSKUs-Assignment"
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
  scope                = var.MgmtGroupID
  policy_definition_id = var.Policy-AuditResourceGroupLocks-ID
  description          = "Policy Assignment to audit Resource Group Delete Locks."
  display_name         = "DEMO-AuditResourceGroupLocks-Assignment"
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
  scope                = var.MgmtGroupID
  policy_definition_id = var.Policy-RestrictClassicResources-ID
  description          = "Policy Assignment to restrict the use of Classic resource types."
  display_name         = "DEMO-RestrictClassicResources-Assignment"
  parameters = <<PARAMETERS
    {
    }   
PARAMETERS
}