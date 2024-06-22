# resource "null_resource" "docker-install" {
#   provisioner "remote-exec" {
#     connection {
#       type        = "ssh"
#       user        = "tsrlearning"
#       private_key = var.private_key
#       host        = azurerm_linux_virtual_machine.vm["vm-1"].private_ip_address
#     }

#     inline = [
#       "sudo DEBIAN_FRONTEND=noninteractive apt-get -y update",
#       "sudo DEBIAN_FRONTEND=noninteractive apt-get -y install apt-transport-https ca-certificates curl software-properties-common",
#       "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -",
#       "sudo DEBIAN_FRONTEND=noninteractive add-apt-repository -y \"deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable\"",
#       "sudo DEBIAN_FRONTEND=noninteractive apt-get -y update",
#       "sudo DEBIAN_FRONTEND=noninteractive apt-get -y install docker-ce",
#       "sudo groupadd docker || true", # Ensure the docker group exists
#       "sudo usermod -aG docker ${var.vm_username}",
#       "sudo systemctl enable docker",
#       "sudo systemctl start docker"
#     ]
#   }
#   depends_on = [azurerm_linux_virtual_machine.vm]
# }

# # resource "null_resource" "mysql_install" {
# #   provisioner "file" {
# #     connection {
# #       type        = "ssh"
# #       user        = "tsrlearning"
# #       private_key = file("tsrlearningkey")
# #       host        = azurerm_public_ip.vm_1.ip_address
# #     }

# #     source      = "install_mysql.sh"
# #     destination = "/home/tsrlearning/install_mysql.sh"
# #   }
# #   provisioner "remote-exec" {
# #     connection {
# #       type        = "ssh"
# #       user        = "tsrlearning"
# #       private_key = file("tsrlearningkey")
# #       host        = azurerm_public_ip.vm_1.ip_address
# #     }

# #     inline = [
# #       "chmod +x /home/tsrlearning/install_mysql.sh",
# #       "sudo /home/tsrlearning/install_mysql.sh"
# #     ]
# #   }
# #   depends_on = [azurerm_linux_virtual_machine.vm]
# # }
