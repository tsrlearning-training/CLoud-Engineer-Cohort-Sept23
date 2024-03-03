output "vnet_name" {
  value = azurerm_virtual_network.vnet.name
}

output "pip_id" {
  value = module.virtual_network.ip_address
}


output "ip_address" {
  value = azurerm_public_ip.pip.ip_address
}