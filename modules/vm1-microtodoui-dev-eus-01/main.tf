


resource "azurerm_virtual_machine" "main" {
  name                  = var.name
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = var.network_interface_ids
  vm_size               = var.vm_size

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  storage_os_disk {
    name              = var.disk
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "mypc"
    admin_username = "devops"
    admin_password = "Devops@123456!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }

}