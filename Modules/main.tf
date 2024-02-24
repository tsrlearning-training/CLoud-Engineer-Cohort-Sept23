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
  snet_address_prefixes = ["10.0.1.0/24"]
  resource_group_name   = module.rg.rg_name
  location              = module.rg.rg_location
  public_ip_address_id  = module.vnet.pip_id
  virtual_network_name  = module.vnet.vnet_name
}