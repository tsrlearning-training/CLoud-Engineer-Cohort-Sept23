# resource "null_resource" "vault_install" {

#   provisioner "file" {
#     connection {
#       type        = "ssh"
#       user        = "tsrlearning"
#       private_key = var.private_key
#       host        = azurerm_public_ip.vm_2.ip_address
#     }

#     source      = "vault/install_vault.sh"
#     destination = "/home/tsrlearning/install_vault.sh"
#   }

#   provisioner "remote-exec" {
#     connection {
#       type        = "ssh"
#       user        = "tsrlearning"
#       private_key = var.private_key
#       host        = azurerm_public_ip.vm_2.ip_address
#     }

#     inline = [
#       "chmod +x /home/tsrlearning/install_vault.sh",
#       "sudo /home/tsrlearning/install_vault.sh"
#     ]
#   }
#   depends_on = [azurerm_linux_virtual_machine.vm]
# }