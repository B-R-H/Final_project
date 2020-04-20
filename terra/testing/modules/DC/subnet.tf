resource "azurerm_subnet" "default" {
  name                 = "internal"
  resource_group_name  = var.resource_group.name
  virtual_network_name = var.virtual_network.name
  address_prefix       = "10.0.2.0/24"
}