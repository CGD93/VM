resource "azurerm_resource_group" "RG" {
  name          = var.RG-name
  location      = var.RG-location
  tags          = var.tag
}

resource "azurerm_virtual_network" "VN" {
  name                  = var.VN-name 
  resource_group_name   = azurerm_resource_group.RG.name
  location              = azurerm_resource_group.RG.location
  address_space         = [var.VN-address]
  tags          = var.tag
}

resource "azurerm_subnet" "Subnet" {
  name                  = var.sub-name
  resource_group_name   = azurerm_resource_group.RG.name
  virtual_network_name  = azurerm_virtual_network.VN.name
  address_prefixes      = [var.sub-add]
}

#Public_ip
resource "azurerm_public_ip" "Public_ip" {
    name                = var.Public_ip_name
    resource_group_name = azurerm_resource_group.RG.name
    location            = azurerm_resource_group.RG.location
    allocation_method   = "Dynamic"
    tags                = var.tag
}

#Network_InterFace_Card_Static
resource "azurerm_network_interface" "NIC_Static" {
    name                  = var.Static_NIC_name
    resource_group_name = azurerm_resource_group.RG.name
    location            = azurerm_resource_group.RG.location

    ip_configuration {
      name                                  = "S-Nic_ip"
      subnet_id                             = azurerm_subnet.Subnet.id
      private_ip_address_allocation         = "Static" 
      private_ip_address                    = var.private_ip_add
      public_ip_address_id                  = azurerm_public_ip.Public_ip.id
    }
    tags                                    = var.tag
}

#Virtual_Machine
resource "azurerm_virtual_machine" "VM" {
    name                    = var.vm_name
    resource_group_name = azurerm_resource_group.RG.name
    location            = azurerm_resource_group.RG.location
    network_interface_ids   = [ azurerm_network_interface.NIC_Static.id ]
    vm_size                 = "Standard_D2s_v3"

    storage_image_reference {
      publisher     = "MicrosoftWindowsDesktop"
      offer         = "Windows-10"
      sku           = "20h2-ent-g2"
      version       = "latest"
    }

    storage_os_disk {
      name                  = "os-A"
      caching               = "ReadWrite"
      create_option         = "FromImage"
      managed_disk_type     = "Premium_LRS"
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
