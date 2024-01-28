resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = local.network_tags.region
  tags     = local.common_tags
}