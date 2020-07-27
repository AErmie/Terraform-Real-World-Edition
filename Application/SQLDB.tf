resource "azurerm_sql_server" "AppSQLServer" {
  name                         = lower(join("", [substr("sqlserver-${var.Environment}-${var.AppName}-001",0,63), ""]))
  resource_group_name          = azurerm_resource_group.AppResourceGroup.name
  location                     = azurerm_resource_group.AppResourceGroup.location
  version                      = "12.0"
  administrator_login          = "newsigdev"
  administrator_login_password = "P@ssw0rd"
  tags = {
    Environment = var.Environment
    CreatedBy = "Terraform"
  }  
}

resource "azurerm_sql_database" "landingDB" {
  name                = "landingDB-${var.Environment}"
  resource_group_name = azurerm_resource_group.AppResourceGroup.name
  location            = azurerm_resource_group.AppResourceGroup.location
  server_name         = azurerm_sql_server.AppSQLServer.name
  tags = {
    Environment = var.Environment
    CreatedBy = "Terraform"
  }  
}