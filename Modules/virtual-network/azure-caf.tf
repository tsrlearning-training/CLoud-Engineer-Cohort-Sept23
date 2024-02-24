data "azurecaf_name" "vnet" {
  name          = "ce"
  resource_type = "azurerm_virtual_network"
  suffixes      = ["tsrlearning", "dev-01"]
  clean_input   = true
  separator     = "-"
}

data "azurecaf_name" "pip" {
  name          = "ce"
  resource_type = "azurerm_public_ip"
  suffixes      = ["tsrlearning", "dev-01"]
  clean_input   = true
  separator     = "-"
}