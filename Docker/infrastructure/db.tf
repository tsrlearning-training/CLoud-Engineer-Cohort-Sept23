# resource "azurerm_mssql_server" "mssql_server" {
#   name                         = local.db_name
#   resource_group_name          = module.resource_group.rg_name
#   location                     = module.resource_group.rg_location
#   version                      = "12.0"
#   administrator_login          = data.vault_generic_secret.administrator_login.data["administrator_login"]
#   administrator_login_password = data.vault_generic_secret.administrator_login_password.data["administrator_login_password"]
# }