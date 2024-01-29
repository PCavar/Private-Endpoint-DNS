##Peering between vnets to simulate cloud - on-premises deployment
resource "azurerm_virtual_network_peering" "vnet1_vnet2" {
  name                         = "Vnet1-To-Vnet2"
  resource_group_name          = azurerm_resource_group.main_rg.name
  virtual_network_name         = azurerm_virtual_network.main_vnet.name
  remote_virtual_network_id    = azurerm_virtual_network.main_vnet2.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true

}

resource "azurerm_virtual_network_peering" "vnet2_vnet1" {
  name                         = "Vnet2-To-Vnet1"
  resource_group_name          = azurerm_resource_group.main_rg.name
  virtual_network_name         = azurerm_virtual_network.main_vnet2.name
  remote_virtual_network_id    = azurerm_virtual_network.main_vnet.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
}
