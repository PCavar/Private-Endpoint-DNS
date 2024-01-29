resource "azurerm_private_dns_zone" "dnsprivatezone" {
  name                = "privatelink.azurewebsites.net"
  resource_group_name = azurerm_resource_group.main_rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "dns_zone_link" {
  name                  = "dns-zone-link"
  resource_group_name   = azurerm_resource_group.main_rg.name
  private_dns_zone_name = azurerm_private_dns_zone.dnsprivatezone.name
  virtual_network_id    = azurerm_virtual_network.main_vnet.id
  registration_enabled  = true
}

resource "azurerm_private_dns_resolver" "main_dnsresolver" {
  name                = "Private-Resolver"
  resource_group_name = azurerm_resource_group.main_rg.name
  location            = azurerm_resource_group.main_rg.location
  virtual_network_id  = azurerm_virtual_network.main_vnet2.id
}

resource "azurerm_private_dns_resolver_inbound_endpoint" "main_inbound_ep" {
  name                    = "Inbound-Endpoint"
  private_dns_resolver_id = azurerm_private_dns_resolver.main_dnsresolver.id
  location                = azurerm_private_dns_resolver.main_dnsresolver.location

  ip_configurations {
    private_ip_allocation_method = "Dynamic"
    subnet_id                    = azurerm_subnet.main_inbound_endpoint_subnet.id
  }
}
