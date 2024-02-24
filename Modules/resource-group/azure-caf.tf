resource "azurecaf_name" "rg" {
  name          = "ce"
  resource_type = "azurerm_resource_group"
  suffixes      = ["tsrlearning", "dev-01"]
  clean_input   = true
  separator     = "-"
}