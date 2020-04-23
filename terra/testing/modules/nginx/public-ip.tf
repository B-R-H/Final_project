resource "azurerm_public_ip" "nginx" {
    name                         = "${terraform.workspace}-nginx-pip"
    location                     = var.resource_group.location
    resource_group_name          = var.resource_group.name
    allocation_method            = "Dynamic"
}