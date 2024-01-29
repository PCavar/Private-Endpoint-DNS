resource "azurerm_private_endpoint" "webapp_endpoint" {
  name                = var.main_private_endpoint_name
  location            = azurerm_resource_group.main_rg.location
  resource_group_name = azurerm_resource_group.main_rg.name
  subnet_id           = azurerm_subnet.vnet2_subnet1.id

  private_service_connection {
    name                           = "webapp-connection"
    private_connection_resource_id = azurerm_windows_web_app.main_webapp.id
    subresource_names              = ["sites"]
    is_manual_connection           = false
  }

  ip_configuration {
    name               = "ipconfig-1"
    private_ip_address = "30.1.0.10"
    subresource_name   = "sites"
  }

  private_dns_zone_group {
    name                 = "my-dns-zone-group"
    private_dns_zone_ids = [azurerm_private_dns_zone.dnsprivatezone.id]
  }
}
