# Remove StrongType from Metadata "strongType": "VMSKUs"
resource "azurerm_policy_definition" "AllowedVMSKUs" {
  name                = "DEMO-Policy-Compute-AllowedVMSKUs"
  policy_type         = "Custom"
  mode                = "Indexed"
  display_name        = "DEMO-Policy-Compute-AllowedVMSKUs"
  description         = "This policy enables you to restrict the VM SKUs your organization can use when deploying resources."
  management_group_id = var.MgmtGroupID
  metadata = <<META
  {
    "category": "DEMO-Custom"
  }
META
  policy_rule = <<POLICY_RULE
    {
		"if": {
			"allOf": [
				{
					"field": "type",
					"equals": "Microsoft.Compute/virtualMachines"
				},
				{
					"not": {
						"field": "Microsoft.Compute/virtualMachines/sku.name",
						"in": "[parameters('listOfAllowedSKUs')]"
					}
				}
			]
		},
		"then": {
			"effect": "Deny"
		}
	}
POLICY_RULE
  parameters = <<PARAMETERS
    {
			"listOfAllowedSKUs": {
			"type": "Array",
				"metadata": {
					"displayName": "Allowed SKUs",
					"description": "The list of SKUs that can be specified for virtual machines. Allowed SKUs are: Standard_F1s, Standard_E2s_v3, Standard_E4s_v3, Standard_E8s_v3, Standard_E16s_v3, Standard_E32-8s_v3, Standard_E32-16_v3.",
					"strongType": "VMSKUs"
				},
				"allowedValues": [
					"Standard_F1s",
					"Standard_E2s_v3",
					"Standard_E4s_v3",
					"Standard_E8s_v3",
					"Standard_E16s_v3",
					"Standard_E32-8s_v3",
					"Standard_E32-16_v3"
				]
			}
  	}
PARAMETERS
}