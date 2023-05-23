output "Public_ip_N" {
  value = var.Public_ip_name
}
output "RG_N" {
  value = var.RG_name
}
output "location_N" {
  value = var.Location
}
output "Static_NIC_N" {
  value = var.Static_NIC_name
}
output "S_ip_con_N" {
  value = var.S_ip_con_name
}
output "sub_N" {
  value = var.subnet
}
output "private_ip_address" {
  value = var.private_ip_add
}
output "vm_N" {
  value = var.vm_name
}
output "virtual_M_size" {
  value = var.vm_size
}
output "image_publisher" {
  value = var.image_reference_publisher
}

output "image_offer" {
  value = var.image_reference_offer
}

output "image_sku" {
  value = var.image_reference_sku
}

output "image_version" {
  value = var.image_reference_version
}

output "disk_N" {
  value = var.os_disk_name
}

output "disk_caching" {
  value = var.os_disk_caching
}

output "disk_option" {
  value = var.os_disk_option
}

output "disk_type" {
  value = var.os_disk_type
}

output "computer_N" {
  value = var.computer_name
}

output "user_N" {
  value = var.user_name
}

output "user_Pass" {
  value = var.user_password
}
output "tags" {
  value = var.tag
}