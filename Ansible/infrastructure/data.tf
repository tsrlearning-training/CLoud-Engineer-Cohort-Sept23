data "azurecaf_name" "nic_1" {
  name          = "ce"
  resource_type = "azurerm_network_interface"
  suffixes      = ["tsrlearning", "dev-01"]
  clean_input   = true
  separator     = "-"
}

data "azurecaf_name" "nic_2" {
  name          = "ce"
  resource_type = "azurerm_network_interface"
  suffixes      = ["tsrlearning", "dev-02"]
  clean_input   = true
  separator     = "-"
}

data "azurecaf_name" "nic_3" {
  name          = "ce"
  resource_type = "azurerm_network_interface"
  suffixes      = ["tsrlearning", "dev-03"]
  clean_input   = true
  separator     = "-"
}

data "azurecaf_name" "vm_1" {
  name          = "ce"
  resource_type = "azurerm_linux_virtual_machine"
  suffixes      = ["tsrlearning", "dev-01"]
  clean_input   = true
  separator     = "-"
}

data "azurecaf_name" "vm_2" {
  name          = "ce"
  resource_type = "azurerm_linux_virtual_machine"
  suffixes      = ["tsrlearning", "dev-02"]
  clean_input   = true
  separator     = "-"
}

data "azurecaf_name" "vm_3" {
  name          = "ce"
  resource_type = "azurerm_linux_virtual_machine"
  suffixes      = ["tsrlearning", "dev-03"]
  clean_input   = true
  separator     = "-"
}