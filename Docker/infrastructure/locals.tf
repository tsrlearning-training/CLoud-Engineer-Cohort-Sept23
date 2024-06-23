locals {
  common_tags = {
    CompanyName = "TSR Learning"
    CohortBatch = "Cloud Engineering"
    Provider    = "Azure Cloud"
    ManagedWith = "Terraform"
    casecode    = "tsr2024"
  }

  # db_name = "tsrlearningdb"
  # custom_data_vm_1 = var.custom_data_vm_1
  # custom_data_vm_2 = var.custom_data_vm_2
  # custom_data_vm_3 = var.custom_data_vm_3


  virtual_machines = {
    # vm-1 = {
    #   name           = "resumeapp-vm01"
    #   size           = "Standard_F2"
    #   username       = "tsrlearning"
    #   admin_username = "tsrlearning"
    #   public_key     = file("tsrlearningkey.pub")
    #   custom_data    = local.custom_data_vm_1
    #   vars           = {}
    # },

    # vm-2 = {
    #   name           = "hashicorpvault-vm01"
    #   size           = "Standard_F2"
    #   admin_username = "tsrlearning"
    #   username       = "tsrlearning"
    #   public_key     = file("tsrlearningkey.pub")
    #   custom_data    = local.custom_data_vm_2
    #   vars           = {}
    # },

    # vm-3 = {
    #   name           = "ghrunner-vm01"
    #   size           = "Standard_F2"
    #   admin_username = "tsrlearning"
    #   username       = "tsrlearning"
    #   public_key     = file("tsrlearningkey.pub")
    #   custom_data    = local.custom_data_vm_3
    #   vars = {
    #     # RUNNER_URL = "https://github.com/actions/runner/releases/download/v2.317.0/actions-runner-linux-x64-2.317.0.tar.gz"
    #     # RUNNER_SHA = "9e883d210df8c6028aff475475a457d380353f9d01877d51cc01a17b2a91161d"
    #     # RUNNER_TAR = "./actions-runner-linux-x64-2.317.0.tar.gz"
    #     # TOKEN      = data.vault_generic_secret.gh_token.data["TOKEN"]
    #   }
    # }
  }
  network_interface_ids = {
    vm-1 = {
      name                 = data.azurecaf_name.nic_1.result
      public_ip_address_id = azurerm_public_ip.vm_1.id
      subnet_id            = module.subnet.snet_id
    },

    vm-2 = {
      name                 = data.azurecaf_name.nic_2.result
      public_ip_address_id = azurerm_public_ip.vm_2.id
      subnet_id            = module.subnet.snet_id
    },

    vm-3 = {
      name                 = data.azurecaf_name.nic_3.result
      public_ip_address_id = azurerm_public_ip.vm_3.id
      subnet_id            = module.subnet.snet_id
    }
  }
}
