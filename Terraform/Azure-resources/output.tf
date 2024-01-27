output "vm_public_ip" {
  value = azurerm_linux_virtual_machine.vm.public_ip_address
}

output "lookupvm_public_ip" {
  value = azurerm_linux_virtual_machine.lookup_vm.public_ip_address
}