variable "virtual_network_name" {
  description = "The name of the Azure Resource Group"
  type        = string
  
}
variable "resource_group_location" {
  description = "The location of the Azure Resource Group"
  type        = string
  default     = "East US"
  
}
variable "resource_group_name" {
  description = "The name of the Azure Resource Group"
  type        = string
  
}
variable "address_space" {
  description = "The address space for the virtual network"
  type        = list(string)

}