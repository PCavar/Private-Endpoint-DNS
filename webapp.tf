resource "azurerm_service_plan" "main_srvc_plan" {
  name                = var.main_appservice_plan
  resource_group_name = azurerm_resource_group.main_rg.name
  location            = azurerm_resource_group.main_rg.location
  os_type             = "Windows"
  sku_name            = "P1v2"
}

resource "azurerm_windows_web_app" "main_webapp" {
  name                          = var.main_webapp_name
  resource_group_name           = azurerm_resource_group.main_rg.name
  location                      = azurerm_resource_group.main_rg.location
  service_plan_id               = azurerm_service_plan.main_srvc_plan.id
  public_network_access_enabled = false

  site_config {}
}
