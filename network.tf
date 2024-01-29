resource "azurerm_virtual_network" "main_vnet" {
  name                = "${var.prefix}-${var.main_vnet["vnet1"].vnet_name}"
  location            = azurerm_resource_group.main_rg.location
  resource_group_name = azurerm_resource_group.main_rg.name
  address_space       = [var.main_vnet["vnet1"].vnet_cidr]
  /*dns_servers         = [azurerm_private_dns_resolver_inbound_endpoint.main_inbound_ep.ip_configurations[0].private_ip_address]*/
  tags = {
    Environment = "Test"
  }
}

resource "azurerm_subnet" "subnet_1" {
  name                 = var.main_vnet["vnet1"].subnet_1_name
  resource_group_name  = azurerm_resource_group.main_rg.name
  virtual_network_name = azurerm_virtual_network.main_vnet.name
  address_prefixes     = [var.main_vnet["vnet1"].subnet_1_cidr]
}

resource "azurerm_subnet" "subnet_bastion" {
  name                 = var.main_vnet["vnet1"].subnet_bastion_name
  resource_group_name  = azurerm_resource_group.main_rg.name
  virtual_network_name = azurerm_virtual_network.main_vnet.name
  address_prefixes     = [var.main_vnet["vnet1"].subnet_bastion_cidr]
}

resource "azurerm_virtual_network" "main_vnet2" {
  name                = "${var.prefix}-${var.vnet2["vnet2"].vnet_name}"
  location            = azurerm_resource_group.main_rg.location
  resource_group_name = azurerm_resource_group.main_rg.name
  address_space       = [var.vnet2["vnet2"].vnet_cidr]

  tags = {
    Environment = "Test"
  }
}

resource "azurerm_subnet" "vnet2_subnet1" {
  name                                      = var.vnet2["vnet2"].subnet_1_name
  resource_group_name                       = azurerm_resource_group.main_rg.name
  virtual_network_name                      = azurerm_virtual_network.main_vnet2.name
  address_prefixes                          = [var.vnet2["vnet2"].subnet_1_cidr]
  private_endpoint_network_policies_enabled = false
}

resource "azurerm_subnet" "main_inbound_endpoint_subnet" {
  name                                      = var.vnet2["vnet2"].inbound_endpoint_name
  resource_group_name                       = azurerm_resource_group.main_rg.name
  virtual_network_name                      = azurerm_virtual_network.main_vnet2.name
  address_prefixes                          = [var.vnet2["vnet2"].inbound_endpoint_cidr]
  private_endpoint_network_policies_enabled = false

  delegation {
    name = "Microsoft.Network.dnsResolvers"
    service_delegation {
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
      name    = "Microsoft.Network/dnsResolvers"
    }
  }
}
