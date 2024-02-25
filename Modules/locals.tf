locals {
  virtual_machines = {
    vm-1 = {
      name           = data.azurecaf_name.vm_1.result
      size           = "Standard_F2"
      username       = "demo"
      admin_username = "demo"
      public_key     = file("tsrlearning-key.pub")
    },
    vm-2 = {
      name           = data.azurecaf_name.vm_2.result
      size           = "Standard_F2"
      admin_username = "tsrlearning"
      username       = "tsrlearning"
      public_key     = file("tsrlearningkey.pub")
    }
  }
  network_interface_ids = {
    vm-1 = {
      name = data.azurecaf_name.nic_1.result
    },
    vm-2 = {
      name = data.azurecaf_name.nic_2.result
    }
  }
}
