resource "azurerm_public_ip" "pip_lb" {
  name                = "piplb-tsrlearning-dev-01"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
}

resource "azurerm_lb" "lb" {
  name                = "lbe-tsrlearning-dev-01"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  frontend_ip_configuration {
    name                 = "publicIPAddress"
    public_ip_address_id = azurerm_public_ip.pip_lb.id
  }
}

resource "azurerm_lb_probe" "http_probe" {
  name                = "http-probe"
  loadbalancer_id     = azurerm_lb.lb.id
  protocol            = "Http"
  port                = 80
  request_path        = "/"
  interval_in_seconds = 5
  number_of_probes    = 2
}

resource "azurerm_lb_rule" "http_rule" {
  name                           = "http-rule"
  loadbalancer_id                = azurerm_lb.lb.id
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "publicIPAddress"
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.beap.id]
  probe_id                       = azurerm_lb_probe.http_probe.id
}

resource "azurerm_lb_rule" "https_rule" {
  name                           = "https-rule"
  loadbalancer_id                = azurerm_lb.lb.id
  protocol                       = "Tcp"
  frontend_port                  = 443
  backend_port                   = 443
  frontend_ip_configuration_name = "publicIPAddress"
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.beap.id]
  probe_id                       = azurerm_lb_probe.http_probe.id
}

resource "azurerm_lb_backend_address_pool" "beap" {
  name            = "beap-tsrlearning-dev-01"
  loadbalancer_id = azurerm_lb.lb.id
}

resource "azurerm_network_interface_backend_address_pool_association" "lb_nic_assoc" {
  network_interface_id    = azurerm_network_interface.nic.id
  ip_configuration_name   = "devnicsnet"
  backend_address_pool_id = azurerm_lb_backend_address_pool.beap.id
}
