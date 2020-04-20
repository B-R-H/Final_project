provider "azurerm" {
  version = "=2.0.0"
  features {}
}

resource "azurerm_resource_group" "default" {
  name     = terraform.workspace
  location = "uksouth"
}

module "nginx" {
  source          = "./modules/nginx"
  admin_user      = var.admin_user
  resource_group  = azurerm_resource_group.default
  virtual_network = azurerm_virtual_network.default
}

module "DC" {
  source          = "./modules/DC"
  admin_user      = var.admin_user
  resource_group  = azurerm_resource_group.default
  virtual_network = azurerm_virtual_network.default
}


resource "azurerm_virtual_network" "default" {
  name                = "${terraform.workspace}-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name
}