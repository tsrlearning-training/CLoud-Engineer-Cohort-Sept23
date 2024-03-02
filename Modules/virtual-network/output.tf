output "vnet_name" {
  value = azurerm_virtual_network.vnet.name
}

output "pip_id" {
  value = azurerm_public_ip.pip.id
}


output "ip_address" {
  value = azurerm_public_ip.pip.ip_address
}