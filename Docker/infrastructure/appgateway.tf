# resource "azurerm_public_ip" "resume_app" {
#   name                = "resume-app-pip"
#   location            = module.resource_group.rg_location
#   resource_group_name = module.resource_group.rg_name
#   allocation_method   = "Static"
#   sku                 = "Standard"
#   # domain_name_label   = "resume-dev-app"
# }

# locals {
#   backend_address_pool_name      = "${module.virtual_network.vnet_name}-beap"
#   frontend_port_name             = "${module.virtual_network.vnet_name}-feport"
#   https_frontend_port_name       = "${module.virtual_network.vnet_name}-https-feport"
#   frontend_ip_configuration_name = "${module.virtual_network.vnet_name}-feip"
#   http_setting_name              = "${module.virtual_network.vnet_name}-be-htst"
#   listener_name                  = "${module.virtual_network.vnet_name}-httplstn"
#   request_routing_rule_name      = "${module.virtual_network.vnet_name}-rqrt"
#   https_listener_name            = "${module.virtual_network.vnet_name}-httpslstn"
#   redirect_configuration_name    = "${module.virtual_network.vnet_name}-rdrcfg"
#   health_probe_name              = "${module.virtual_network.vnet_name}-healthprobe"
# }

# resource "azurerm_application_gateway" "resume_app" {
#   name                = "resume-app-appgateway"
#   location            = module.resource_group.rg_location
#   resource_group_name = module.resource_group.rg_name

#   sku {
#     name     = "WAF_v2"
#     tier     = "WAF_v2"
#     capacity = 2
#   }

#   waf_configuration {
#     enabled          = true
#     rule_set_version = "3.2"
#     firewall_mode    = "Detection"
#   }

#   gateway_ip_configuration {
#     name      = "resume-app-gateway-ip-conf"
#     subnet_id = module.appgw_subnet.snet_id
#   }

#   frontend_port {
#     name = local.frontend_port_name
#     port = 80
#   }

#   frontend_port {
#     name = local.https_frontend_port_name
#     port = 443
#   }

#   frontend_ip_configuration {
#     name                 = local.frontend_ip_configuration_name
#     public_ip_address_id = azurerm_public_ip.resume_app.id
#   }

#   backend_address_pool {
#     name = local.backend_address_pool_name
#   }

#   backend_http_settings {
#     name                  = local.http_setting_name
#     cookie_based_affinity = "Disabled"
#     port                  = 5000
#     protocol              = "Http"
#     request_timeout       = 20
#     probe_name            = local.health_probe_name
#   }

#   http_listener {
#     name                           = local.listener_name
#     frontend_ip_configuration_name = local.frontend_ip_configuration_name
#     frontend_port_name             = local.frontend_port_name
#     protocol                       = "Http"
#   }

#   http_listener {
#     name                           = local.https_listener_name
#     frontend_ip_configuration_name = local.frontend_ip_configuration_name
#     frontend_port_name             = local.https_frontend_port_name
#     protocol                       = "Https"
#     ssl_certificate_name           = "tsrlearning.link"
#   }

#   request_routing_rule {
#     name                       = local.request_routing_rule_name
#     priority                   = 1
#     rule_type                  = "Basic"
#     http_listener_name         = local.listener_name
#     backend_address_pool_name  = local.backend_address_pool_name
#     backend_http_settings_name = local.http_setting_name
#   }

#   request_routing_rule {
#     name                       = "${local.request_routing_rule_name}-https"
#     priority                   = 2
#     rule_type                  = "Basic"
#     http_listener_name         = local.https_listener_name
#     backend_address_pool_name  = local.backend_address_pool_name
#     backend_http_settings_name = local.http_setting_name
#   }

#   redirect_configuration {
#     name                 = local.redirect_configuration_name
#     redirect_type        = "Permanent"
#     target_listener_name = local.https_listener_name
#   }

#   ssl_certificate {
#     name     = "tsrlearning.link"
#     data     = filebase64("tsrlearning.link_cert/tsrlearning.link.pfx")
#     password = data.vault_generic_secret.tsrlearning_link_cert.data["ssl-password-tsrlearning-link"]
#   }

#   probe {
#     name                = local.health_probe_name
#     protocol            = "Http"
#     path                = "/"
#     interval            = 30
#     timeout             = 30
#     unhealthy_threshold = 3
#     minimum_servers     = 2
#     port                = 5000
#     host                = "tsrlearning.link"

#     match {
#       status_code = ["200-399"]
#     }
#   }

#   tags = local.common_tags
# }

# resource "azurerm_network_interface_application_gateway_backend_address_pool_association" "beap_nic" {
#   for_each                = local.network_interface_ids
#   network_interface_id    = azurerm_network_interface.nic[each.key].id
#   ip_configuration_name   = "vm-1"
#   backend_address_pool_id = tolist(azurerm_application_gateway.resume_app.backend_address_pool).0.id
# }