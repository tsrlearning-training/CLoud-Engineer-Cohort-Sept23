resource "azurerm_resource_group" "rg" {
  name     = "rg-tsrlearning-dev-01"
  location = local.network_tags.region
  tags     = local.common_tags
}