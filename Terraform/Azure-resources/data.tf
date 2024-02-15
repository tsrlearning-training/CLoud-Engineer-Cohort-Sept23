# data "azurerm_subnet" "lookup_snet" {
#   name                 = local.network_tags.lookup_snet
#   virtual_network_name = azurerm_virtual_network.vnet.name
#   resource_group_name  = azurerm_resource_group.rg.name
# }


# data "cloudinit_config" "php" {
#   gzip          = false
#   base64_encode = true
#   part {
#     filename     = "php.sh"
#     content_type = "text/x-shellscript"

#     content = file("${path.module}/php.sh")
#   }
# }

data "azurerm_key_vault_secret" "secret" {
  name         = "dev-db-password"
  key_vault_id = azurerm_key_vault.kv.id
}

data "azuread_user" "user" {
  object_id = "0bb1e3bf-13c3-4095-8208-19e139b897d1"
}
