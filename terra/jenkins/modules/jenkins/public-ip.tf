resource "azurerm_public_ip" "jenkins" {
    name                         = "${terraform.workspace}-jenkins-pip"
    location                     = var.resource_group.location
    resource_group_name          = var.resource_group.name
    allocation_method            = "Dynamic"
}