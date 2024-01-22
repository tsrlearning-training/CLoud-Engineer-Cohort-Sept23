resource "azurerm_resource_group" "rg" {
  name     = "rg-tsrlearning-dev-01"
  location = "West Europe"
  tags     = local.common_tags
}