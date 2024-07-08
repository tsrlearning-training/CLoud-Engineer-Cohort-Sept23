resource "azurerm_resource_group" "rg" {
  name     = coalesce(local.resource_name, "flaskrun")
  location = "westus2"
}
