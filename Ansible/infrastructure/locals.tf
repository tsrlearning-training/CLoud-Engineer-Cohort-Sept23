locals {
  virtual_machines = {
    vm-1 = {
      name           = data.azurecaf_name.vm_1.result
      size           = "Standard_F2"
      username       = "demo"
      admin_username = "demo"
      public_key     = file("tsrlearningkey.pub")
    },
    vm-2 = {
      name           = data.azurecaf_name.vm_2.result
      size           = "Standard_F2"
      admin_username = "tsrlearning"
      username       = "tsrlearning"
      public_key     = file("tsrlearningkey.pub")
    },
    vm-3 = {
      name           = data.azurecaf_name.vm_3.result
      size           = "Standard_F2"
      admin_username = "tsrlearning"
      username       = "tsrlearning"
      public_key     = file("tsrlearningkey.pub")
    }
  }
  network_interface_ids = {
    vm-1 = {
      name                 = data.azurecaf_name.nic_1.result
      public_ip_address_id = azurerm_public_ip.vm_1.id

    },
    vm-2 = {
      name = data.azurecaf_name.nic_2.result
      public_ip_address_id = module.virtual_network.pip_id
    },
    vm-3 = {
      name                 = data.azurecaf_name.nic_3.result
      public_ip_address_id = azurerm_public_ip.vm_3.id
    }
  }
}
