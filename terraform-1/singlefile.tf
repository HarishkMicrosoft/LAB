
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.116.0"
    }
  }
  backend "local" {
    path = "dev.terraform.tfstate"
    #path = "prod.terraform.tfstate"
  }
}

# Reference the existing resource group
data "azurerm_resource_group" "cloud_rg" {
  name = "1-2a045ab7-playground-sandbox"
}

provider "azurerm" {

  skip_provider_registration = true
  features {}
}

resource "azurerm_virtual_network" "vnet0821lab" {
  name                = var.vnet_name
  location            = data.azurerm_resource_group.cloud_rg.location
  resource_group_name = data.azurerm_resource_group.cloud_rg.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]
}
resource "azurerm_subnet" "subnet1-0821lab" {
  name                 = var.subnet_name
  resource_group_name  = data.azurerm_resource_group.cloud_rg.name
  virtual_network_name = azurerm_virtual_network.vnet0821lab.name
  address_prefixes     = ["10.0.1.0/24"] 
}  
resource "azurerm_subnet" "subnet2-0821lab" {
  name                 = var.subnet1_name
  resource_group_name  = data.azurerm_resource_group.cloud_rg.name
  virtual_network_name = azurerm_virtual_network.vnet0821lab.name
  address_prefixes     = ["10.0.2.0/24"] 
}  
variable "vnet_name" {
  description = "name for VNET and subnetxcv"
  type      = string
  default   = "vnetx2"
}

variable "subnet_name" {
  description = "name for VNET and subnetxcv"
  type      = string
  default   = "subnet321x"
}

variable "subnet1_name" {
  description = "name for VNET and subnetxcv"
  type      = string
  default   = "subnet1321x"
}

