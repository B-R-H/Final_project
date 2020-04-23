resource "azurerm_network_security_group" "jenkins" {
    name                = "jenkins-nsg"
    location            = var.resource_group.location
    resource_group_name = var.resource_group.name
    
    security_rule {
        name                       = "SSH"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }
}