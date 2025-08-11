variable "nic_name" {
  description = "The name of the network interface."
  type        = string
  
}
variable "resource_group_name" {
  description = "The name of the resource group where the subnet will be created."
  type        = string
  
}
variable "location" {
  description = "The location of the resource group."
  type        = string
  
}
variable "subnet_id" {  
  description = "The ID of the subnet where the network interface will be created."
  type        = string
  
}
variable "vm_name" {
  description = "The name of the virtual machine."
  type        = string
  
}
variable "vm_size" {
  description = "The size of the virtual machine."
  type        = string
  
}
variable "admin_username" {
  type = string
}

variable "admin_password" {
  type = string
}
variable "image_publisher" {
  description = "The publisher of the image used for the virtual machine."
  type        = string
  
}
variable "image_offer" {
  description = "The offer of the image used for the virtual machine."
  type        = string
  
}
variable "image_sku" {
  description = "The SKU of the image used for the virtual machine."
  type        = string
  
}
variable "image_version" {
  description = "The version of the image used for the virtual machine."
  type        = string
  default     = "latest"
  
}