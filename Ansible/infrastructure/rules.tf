resource "azurerm_network_security_rule" "ssh_rule" {
  name                        = "SSHRule"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "209.214.68.131/32"
  destination_address_prefix  = "*"
  description                 = "NSG used for SSH login to Linux Server"
  resource_group_name         = module.resource_group.rg_name
  network_security_group_name = module.subnet.nsg_name
}

resource "azurerm_network_security_rule" "http_rule" {
  name                        = "HTTPRule"
  priority                    = 101
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "209.214.68.131/32"
  destination_address_prefix  = "*"
  description                 = "NSG used for HTTP connectivity"
  resource_group_name         = module.resource_group.rg_name
  network_security_group_name = module.subnet.nsg_name
}

resource "azurerm_network_security_rule" "https_rule" {
  name                        = "HTTPSRule"
  priority                    = 102
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "209.214.68.131/32"
  destination_address_prefix  = "*"
  description                 = "NSG used for HTTPS connectivity"
  resource_group_name         = module.resource_group.rg_name
  network_security_group_name = module.subnet.nsg_name
}
