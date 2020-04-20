resource "azurerm_network_interface" "DC" {
  name                = "${terraform.workspace}-DC-nic"
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name

  ip_configuration {
    name                          = "${terraform.workspace}-DC"
    subnet_id                     = azurerm_subnet.default.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.DC.id
  }
}