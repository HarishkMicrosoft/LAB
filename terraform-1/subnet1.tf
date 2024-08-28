pushresource "azurerm_subnet" "subnet4-0821lab" {
  name                 = "subnet4_name"
  resource_group_name  = data.azurerm_resource_group.cloud_rg.name
  virtual_network_name = azurerm_virtual_network.vnet0821lab.name
  address_prefixes     = ["10.0.4.0/24"] 
} 