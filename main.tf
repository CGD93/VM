#Public_ip
resource "azurerm_public_ip" "Public_ip" {
    name                = var.Public_ip_name
    resource_group_name = var.RG-name
    location            = var.Location
    allocation_method   = "Dynamic"
    tags                = var.tag
}

#Network_InterFace_Card_Static
resource "azurerm_network_interface" "NIC_Static" {
    name                  = var.Static_NIC_name
    resource_group_name   = var.RG-name
    location              = var.Location

    ip_configuration {
      name                                  = var.S_ip_con_name
      subnet_id                             = var.subnet
      private_ip_address_allocation         = "Static" 
      private_ip_address                    = var.private_ip_add
      public_ip_address_id                  = azurerm_public_ip.Public_ip.id
    }
    tags                                    = var.tag
}

#Virtual_Machine
resource "azurerm_virtual_machine" "VM" {
    name                    = var.vm_name
    resource_group_name     = var.RG-name
    location                = var.Location
    network_interface_ids   = [ azurerm_network_interface.NIC_Static.id ]
    vm_size                 = var.vm_size

    storage_image_reference {
      publisher     = var.image_reference_publisher
      offer         = var.image_reference_offer
      sku           = var.image_reference_sku
      version       = var.image_reference_version
    }

    storage_os_disk {
      name                  = var.os_disk_name
      caching               = var.os_disk_caching
      create_option         = var.os_disk_option
      managed_disk_type     = var.os_disk_type
    }

    os_profile {
      computer_name     = var.computer_name
      admin_username    = var.user_name
      admin_password    = var.user_password
    }

    os_profile_windows_config {
      #disable_password_authentication = false
    }
    tags = var.tag
}
