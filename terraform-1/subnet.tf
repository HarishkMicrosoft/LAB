resource "azurerm_subnet" "subnet3-0821lab" {
  name                 = "subnet3_name"
  resource_group_name  = data.azurerm_resource_group.cloud_rg.name
  virtual_network_name = azurerm_virtual_network.vnet0821lab.name
  address_prefixes     = ["10.0.3.0/24"] 
} 