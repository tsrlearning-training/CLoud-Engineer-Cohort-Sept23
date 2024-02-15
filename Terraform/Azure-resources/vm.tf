resource "azurerm_linux_virtual_machine" "vm" {
  name                = var.virtual_machine_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = "Standard_F2"
  admin_username      = local.application_tags.username
  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  admin_ssh_key {
    username   = local.application_tags.username
    public_key = file("tsrlearning-key.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  connection {
    type        = "ssh"
    user        = "tsrlearning-admin"
    private_key = file("tsrlearning-key")
    host        = self.public_ip_address
    timeout     = "30s"
  }

  provisioner "file" {
    source      = "templates/php.sh"
    destination = "/tmp/php.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "echo 'Exporting credentials as variables with terraform'",
      "export db_user='${var.db_user}'",
      "export db_name='${var.db_name}'",
      "export linux_user='${var.linux_user}'",
      # "export db_secrets='${var.db_secrets}'",
      "sudo chmod +x /tmp/php.sh",
      "/tmp/php.sh",
    ]
  }
}

# Attach Disk
# resource "azurerm_managed_disk" "disk" {
#   name                 = "${var.virtual_machine_name}-disk1"
#   location             = azurerm_resource_group.rg.location
#   resource_group_name  = azurerm_resource_group.rg.name
#   storage_account_type = "Standard_LRS"
#   create_option        = "Empty"
#   disk_size_gb         = var.disk_size_gb
# }

# resource "azurerm_virtual_machine_data_disk_attachment" "disk_attachment" {
#   managed_disk_id    = azurerm_managed_disk.disk.id
#   virtual_machine_id = azurerm_linux_virtual_machine.vm.id
#   lun                = "10"
#   caching            = "ReadWrite"
# }