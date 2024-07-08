resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "local_sensitive_file" "pem_file" {
  filename        = pathexpand("${azurerm_linux_virtual_machine.vm.name}-key.pem")
  file_permission = "400"
  content         = tls_private_key.ssh_key.private_key_pem
}