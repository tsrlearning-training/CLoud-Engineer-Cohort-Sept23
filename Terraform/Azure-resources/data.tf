data "azurerm_subnet" "lookup_snet" {
  name                 = local.network_tags.lookup_snet
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name  = azurerm_resource_group.rg.name
}
