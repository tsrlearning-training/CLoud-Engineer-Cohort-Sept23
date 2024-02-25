output "snet_name" {
  value = azurerm_subnet.snet.name
}

output "snet_id" {
  value = azurerm_subnet.snet.id
}

output "nsg_id" {
  value = azurerm_network_security_group.sg.id
}

output "nsg_name" {
  value = azurerm_network_security_group.sg.name
}

# output "nic_id" {
#   value = azurerm_network_interface.nic.id
# }