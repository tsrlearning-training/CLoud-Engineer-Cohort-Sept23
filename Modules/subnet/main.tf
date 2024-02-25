resource "azurerm_subnet" "snet" {
  name                 = coalesce(data.azurecaf_name.snet.result, var.subnet_name)
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = var.snet_address_prefixes
}

# resource "azurerm_network_interface" "nic" {
#   name                = coalesce(data.azurecaf_name.nic.result, var.nic_name)
#   location            = var.location
#   resource_group_name = var.resource_group_name

#   ip_configuration {
#     name                          = "devnicsnet"
#     subnet_id                     = azurerm_subnet.snet.id
#     private_ip_address_allocation = "Dynamic"
#     public_ip_address_id          = var.public_ip_address_id
#   }
# }

resource "azurerm_network_security_group" "sg" {
  name                = coalesce(data.azurecaf_name.nsg.result, var.nsg_name)
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet_network_security_group_association" "nsg_assocation" {
  subnet_id                 = azurerm_subnet.snet.id
  network_security_group_id = azurerm_network_security_group.sg.id
}