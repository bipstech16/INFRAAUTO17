resource "azurerm_mssql_server" "sql" {
  name                         = var.name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.usr
  administrator_login_password = var.pwd
  minimum_tls_version          = "1.2"
}


