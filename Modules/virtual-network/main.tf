resource "azurerm_public_ip" "pip" {
  name                = coalesce(data.azurecaf_name.pip.result, var.pip_name)
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Static"
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.virtual_network_name == "" ? data.azurecaf_name.vnet.result : "vnet-tsrlearning-demo"
  address_space       = var.vnet_address_space
  location            = var.location
  resource_group_name = var.resource_group_name
}