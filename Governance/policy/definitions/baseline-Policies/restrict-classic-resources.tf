resource "azurerm_policy_definition" "RestrictClassicResources" {
  name                = "DEMO-Policy-Global-RestrictClassicResources"
  policy_type         = "Custom"
  mode                = "Indexed"
  display_name        = "DEMO-Policy-Global-RestrictClassicResources"
  description         = "This policy restricts the use of Classic Azure resources."
  management_group_name = var.MgmtGroupName
  metadata = <<META
  {
    "category": "DEMO-Custom"
  }
META
  policy_rule = <<POLICY_RULE
    {
			"if": {
				"field": "type",
				"like": "Microsoft.Classic*"
			},
			"then": {
				"effect": "deny"
			}
		}
POLICY_RULE
}