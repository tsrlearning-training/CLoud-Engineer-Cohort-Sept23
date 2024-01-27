locals {
  common_tags = {
    CompanyName = "TSR Learning"
    CohortBatch = "Cloud Engineering"
    Provider    = "Azure Cloud"
    ManagedWith = "Terraform"
    casecode    = "tsr2024"
  }
  application_tags = {
    suffix               = "dev-01"
    username             = "tsrlearning-admin"
    # storage_account_name = "tsrlearningstor"
    # container_name       = "terraformstate"
  }
  network_tags = {
    region      = "westeurope"
    lookup_snet = "snet-tsrlearning-dev-02"
  }
  security_tags = {}
}