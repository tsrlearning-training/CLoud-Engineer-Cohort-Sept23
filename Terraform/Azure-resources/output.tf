output "vm_public_ip" {
  value = azurerm_linux_virtual_machine.vm.public_ip_address
}

output "local_dns" {
  value = "http://${azurerm_public_ip.pip_lb.ip_address}:80/login.php"
}