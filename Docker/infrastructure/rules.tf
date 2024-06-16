resource "azurerm_network_security_rule" "ssh_rule" {
  name                        = "SSHRule"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "143.55.59.117/32"
  destination_address_prefix  = "*"
  description                 = "NSG used for SSH login to Linux Server"
  resource_group_name         = module.resource_group.rg_name
  network_security_group_name = module.subnet.nsg_name
}

# resource "azurerm_network_security_rule" "http_rule" {
#   name                        = "HTTPRule"
#   priority                    = 101
#   direction                   = "Inbound"
#   access                      = "Allow"
#   protocol                    = "Tcp"
#   source_port_range           = "*"
#   destination_port_range      = "80"
#   source_address_prefix       = "143.55.59.117/32"
#   destination_address_prefix  = "*"
#   description                 = "NSG used for HTTP connectivity"
#   resource_group_name         = module.resource_group.rg_name
#   network_security_group_name = module.subnet.nsg_name
# }

resource "azurerm_network_security_rule" "https_rule" {
  name                        = "HTTPSRule"
  priority                    = 102
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "143.55.59.117/32"
  destination_address_prefix  = "*"
  description                 = "NSG used for HTTPS connectivity"
  resource_group_name         = module.resource_group.rg_name
  network_security_group_name = module.subnet.nsg_name
}

resource "azurerm_network_security_rule" "php_rule" {
  name                        = "PHPRule"
  priority                    = 103
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "9000"
  source_address_prefix       = "143.55.59.117/32"
  destination_address_prefix  = "*"
  description                 = "NSG used for PHP connectivity"
  resource_group_name         = module.resource_group.rg_name
  network_security_group_name = module.subnet.nsg_name
}

resource "azurerm_network_security_rule" "nginx_rule" {
  name                        = "NginxRule"
  priority                    = 104
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "8080"
  source_address_prefix       = "143.55.59.117/32"
  destination_address_prefix  = "*"
  description                 = "NSG used for PHP connectivity"
  resource_group_name         = module.resource_group.rg_name
  network_security_group_name = module.subnet.nsg_name
}

resource "azurerm_network_security_rule" "linkedin_app_rule" {
  name                        = "LinkedinAppRule"
  priority                    = 105
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3001"
  source_address_prefix       = "143.55.59.117/32"
  destination_address_prefix  = "*"
  description                 = "NSG used for PHP connectivity"
  resource_group_name         = module.resource_group.rg_name
  network_security_group_name = module.subnet.nsg_name
}

resource "azurerm_network_security_rule" "react_app_rule" {
  name                        = "ReactAppRule"
  priority                    = 106
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3000"
  source_address_prefix       = "143.55.59.117/32"
  destination_address_prefix  = "*"
  description                 = "NSG used for PHP connectivity"
  resource_group_name         = module.resource_group.rg_name
  network_security_group_name = module.subnet.nsg_name
}

resource "azurerm_network_security_rule" "resume_app_rule" {
  name                        = "resumeAppRule"
  priority                    = 107
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "5000"
  source_address_prefix       = "143.55.59.117/32"
  destination_address_prefix  = "*"
  description                 = "NSG used for PHP connectivity"
  resource_group_name         = module.resource_group.rg_name
  network_security_group_name = module.subnet.nsg_name
}

resource "azurerm_network_security_rule" "GatewayManager" {
  name                        = "GatewayManager"
  priority                    = 108
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_ranges     = ["65200-65535"]
  source_address_prefix       = "GatewayManager"
  destination_address_prefix  = "*"
  resource_group_name         = module.resource_group.rg_name
  network_security_group_name = module.appgw_subnet.nsg_name
}

resource "azurerm_network_security_rule" "AzureLoadBalancer" {
  name                        = "AzureLoadBalancer"
  priority                    = 109
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_ranges     = ["65200-65535"]
  source_address_prefix       = "AzureLoadBalancer"
  destination_address_prefix  = "*"
  resource_group_name         = module.resource_group.rg_name
  network_security_group_name = module.appgw_subnet.nsg_name
}

resource "azurerm_network_security_rule" "resume_http_rule" {
  name                        = "Resume-HTTPRule"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "143.55.59.117/32"
  destination_address_prefix  = "*"
  description                 = "NSG used for HTTP connectivity"
  resource_group_name         = module.resource_group.rg_name
  network_security_group_name = module.appgw_subnet.nsg_name
}

resource "azurerm_network_security_rule" "resume_https_rule" {
  name                        = "Resume-HTTPSRule"
  priority                    = 111
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "143.55.59.117/32"
  destination_address_prefix  = "*"
  description                 = "NSG used for HTTPS connectivity"
  resource_group_name         = module.resource_group.rg_name
  network_security_group_name = module.appgw_subnet.nsg_name
}

resource "azurerm_network_security_rule" "vault_api_addr_rule" {
  name                        = "vault-api-addr-rule"
  priority                    = 112
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "8200"
  source_address_prefix       = "143.55.59.117/32"
  destination_address_prefix  = "*"
  description                 = "NSG used for vault connectivity"
  resource_group_name         = module.resource_group.rg_name
  network_security_group_name = module.subnet.nsg_name
}

resource "azurerm_network_security_rule" "vault_cluster_addr_rule" {
  name                        = "vault-cluster-addr-rule"
  priority                    = 113
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "8201"
  source_address_prefix       = "143.55.59.117/32"
  destination_address_prefix  = "*"
  description                 = "NSG used for vault connectivity"
  resource_group_name         = module.resource_group.rg_name
  network_security_group_name = module.subnet.nsg_name
}
