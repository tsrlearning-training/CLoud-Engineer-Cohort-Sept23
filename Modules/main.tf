module "rg" {
  source   = "./resource-group"
  location = "westus"
  tags = {
    CompanyName = "TSR Learning"
    CohortBatch = "Cloud Engineering"
    Provider    = "Azure Cloud"
    ManagedWith = "Terraform"
    casecode    = "tsr2024"
  }
}

module "vnet" {
  source              = "./virtual-network"
  vnet_address_space  = ["10.0.0.0/16"]
  resource_group_name = module.rg.rg_name
  location            = module.rg.rg_location
}

module "snet" {
  source                = "./subnet"
  use_caf_naming        = false
  subnet_name           = "appgwsnet-ce-dev-01"
  nsg_name              = "appgwnsg-ce-dev-01"
  snet_address_prefixes = ["10.0.1.0/24"]
  resource_group_name   = module.rg.rg_name
  location              = module.rg.rg_location
  public_ip_address_id  = module.vnet.pip_id
  virtual_network_name  = module.vnet.vnet_name
}

module "test_snet" {
  source                = "./subnet"
  snet_address_prefixes = ["10.0.1.0/24"]
  resource_group_name   = module.rg.rg_name
  location              = module.rg.rg_location
  public_ip_address_id  = module.vnet.pip_id
  virtual_network_name  = module.vnet.vnet_name
}


############## VM ##############################
resource "azurerm_network_interface" "nic" {
  for_each            = local.network_interface_ids
  name                = each.value.name
  location            = module.rg.rg_location
  resource_group_name = module.rg.rg_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = module.snet.snet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  for_each            = local.virtual_machines
  name                = each.value.name
  resource_group_name = module.rg.rg_name
  location            = module.rg.rg_location
  size                = each.value.size
  admin_username      = each.value.admin_username
  network_interface_ids = [
    azurerm_network_interface.nic[each.key].id
  ]

  admin_ssh_key {
    username   = each.value.username
    public_key = each.value.public_key
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
}
