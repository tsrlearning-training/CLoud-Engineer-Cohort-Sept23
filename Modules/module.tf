module "resource_group" {
  source   = "git::https://github.com/tsrlearning-training/CLoud-Engineer-Cohort-Sept23.git//Modules/resource-group?ref=v1.0.0"
  location = "westus"
  tags = {
    CompanyName = "TSR Learning"
    CohortBatch = "Cloud Engineering"
    Provider    = "Azure Cloud"
    ManagedWith = "Terraform"
    casecode    = "tsr2024"
  }
}

module "virtual_network" {
  source              = "git::https://github.com/tsrlearning-training/CLoud-Engineer-Cohort-Sept23.git//Modules/virtual-network?ref=v1.0.0"
  vnet_address_space  = ["10.1.0.0/16"]
  resource_group_name = module.rg.rg_name
  location            = module.rg.rg_location
}

module "subnet" {
  source                = "git::https://github.com/tsrlearning-training/CLoud-Engineer-Cohort-Sept23.git//Modules/subnet?ref=v1.0.0"
  snet_address_prefixes = ["10.0.2.0/24"]
  resource_group_name   = module.rg.rg_name
  location              = module.rg.rg_location
  public_ip_address_id  = module.vnet.pip_id
  virtual_network_name  = module.vnet.vnet_name
}
