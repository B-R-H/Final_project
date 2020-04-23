resource "azurerm_public_ip" "DC" {
    name                         = "${terraform.workspace}-DC-pip"
    location                     = var.resource_group.location
    resource_group_name          = var.resource_group.name
    allocation_method            = "Dynamic"
}