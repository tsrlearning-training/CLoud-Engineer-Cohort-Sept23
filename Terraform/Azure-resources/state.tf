terraform {
  backend "azurerm" {
    resource_group_name  = "rg-tsrlearning-dev-01"
    storage_account_name = "tsrlearningstor"
    container_name       = "terraformstate"
    key                  = "dev.terraform.tfstate"
  }
}