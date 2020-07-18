resource "azurerm_policy_definition" "AllowedLocations" {
  name                = "DEMO-Policy-Global-AllowedLocations"
  policy_type         = "Custom"
  mode                = "Indexed"
  display_name        = "DEMO-Policy-Global-AllowedLocations"
  description         = "This policy enables you to restrict the locations your organization can specify when deploying resources. Use to enforce your geo-compliance requirements. Excludes resource groups, Microsoft.AzureActiveDirectory/b2cDirectories, and resources that use the 'global' region."
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
						"notEquals": "Microsoft.AzureActiveDirectory/b2cDirectories"
					},
					{
						"field": "location",
						"notEquals": "global"
					},
					{
						"not": {
							"field": "location",
							"in": "[parameters('listOfAllowedLocations')]"
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
			"listOfAllowedLocations": {
				"type": "Array",
				"metadata": {
					"displayName": "Allowed locations",
					"description": "The list of locations that can be specified when deploying resources.",
					"strongType": "location"
				},
				"allowedValues": [
					"CanadaCentral",
					"CanadaEast",
					"EastUS2",
					"CentralUS",
					"EastAsia",
					"SouthEastAsia",
					"JapanEast",
					"JapanWest"
				]
			}
		}
PARAMETERS
}