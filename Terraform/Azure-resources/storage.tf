# Moved state already to backend, removed storage account from tfstate.

# resource "azurerm_storage_account" "stor" {
#   name                     = local.application_tags.storage_account_name
#   resource_group_name      = azurerm_resource_group.rg.name
#   location                 = azurerm_resource_group.rg.location
#   account_tier             = "Standard"
#   account_replication_type = "GRS"

#   tags = local.common_tags
# }

# resource "azurerm_storage_container" "container" {
#   name                  = local.application_tags.container_name
#   storage_account_name  = azurerm_storage_account.stor.name
#   container_access_type = "private"
# }