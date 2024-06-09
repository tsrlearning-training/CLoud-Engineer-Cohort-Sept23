data "azurecaf_name" "subnet" {
  name          = "ce"
  resource_type = "azurerm_subnet"
  suffixes      = ["tsrlearning", "dev-01"]
  clean_input   = true
  separator     = "-"
  use_slug      = var.use_caf_naming
}

data "azurecaf_name" "nic" {
  name          = "ce"
  resource_type = "azurerm_network_interface"
  suffixes      = ["tsrlearning", "dev-01"]
  clean_input   = true
  separator     = "-"
  use_slug      = var.use_caf_naming
}

data "azurecaf_name" "nsg" {
  name          = "ce"
  resource_type = "azurerm_network_security_group"
  suffixes      = ["tsrlearning", "dev-01"]
  clean_input   = true
  separator     = "-"
  use_slug      = var.use_caf_naming
}
