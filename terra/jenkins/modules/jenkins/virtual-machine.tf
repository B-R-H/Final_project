resource "azurerm_virtual_machine" "jenkins" {
    name                  = "${terraform.workspace}-jenkins-vm"
    location              = var.resource_group.location
    resource_group_name   = var.resource_group.name
    network_interface_ids = [azurerm_network_interface.jenkins.id]
    vm_size               = var.vm_size

    storage_image_reference {
      publisher = "Canonical"
      offer     = "UbuntuServer"
      sku       = "16.04-LTS"
      version   = "latest"
    }
    storage_os_disk {
      name              = "${terraform.workspace}-jenkins-vm"
      caching           = "ReadWrite"
      create_option     = "FromImage"
      managed_disk_type = "Standard_LRS"
    }
    os_profile {
      computer_name  = "${terraform.workspace}-jenkins-vm"
      admin_username = var.admin_user
    }
    os_profile_linux_config {
      disable_password_authentication = true
      ssh_keys {
  	  path = "/home/${var.admin_user}/.ssh/authorized_keys"
  	  key_data = file(pathexpand("~/.ssh/id_rsa.pub"))
  	}
  }
}
