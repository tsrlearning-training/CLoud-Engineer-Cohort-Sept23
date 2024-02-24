data "azurecaf_name" "snet" {
  name          = "ce"
  resource_type = "azurerm_subnet"
  suffixes      = ["tsrlearning", "dev-01"]
  clean_input   = true
  separator     = "-"
}

data "azurecaf_name" "nic" {
  name          = "ce"
  resource_type = "azurerm_network_interface"
  suffixes      = ["tsrlearning", "dev-01"]
  clean_input   = true
  separator     = "-"
}

data "azurecaf_name" "nsg" {
  name          = "ce"
  resource_type = "azurerm_network_security_group"
  suffixes      = ["tsrlearning", "dev-01"]
  clean_input   = true
  separator     = "-"
}
