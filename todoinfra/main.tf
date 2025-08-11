# Ek chhota sa shehar tha, jahan ek developer apni zindagi badalne ke liye cloud infrastructure bana raha tha.
# Usne socha, "Chalo Azure par ek todo app banate hain." 
# Sabse pehle resource group banaya, phir virtual network, subnets, aur VMs. 
# Har module ek naye sapne ki tarah tha, aur har resource ek nayi umeed.
# Aakhirkar, database bhi bana diya, taki data safe rahe.
# Is tarah, us developer ne apne sapno ka shehar terraform ki madad se khada kar diya.
#jajhsgdgdh

module "resource_group_name" {
  source              = "../modules/resource_group"
  resource_group_name = "rg_todoapp"
  resource_group_location = "Centralindia"
  #Additional tags can be added here
  #kahani likh do
  
}
module "virtual_network" {
  depends_on           = [module.resource_group_name]
  source               = "../modules/virtual_network"
  resource_group_name  = "rg_todoapp"
  
  virtual_network_name = "vnet_todoapp"
  address_space        = ["10.0.0.0/16"]

}
module "frontend_subnet" {
  depends_on           = [module.virtual_network]
  source               = "../modules/subnet"
  resource_group_name  = "rg_todoapp"
  virtual_network_name = "vnet_todoapp"
  subnet_name          = "subnet_frontend"
  address_prefixes     = ["10.0.1.0/24"]

}
module "backend_subnet" {
  depends_on           = [module.virtual_network]
  source               = "../modules/subnet"
  resource_group_name  = "rg_todoapp"
  virtual_network_name = "vnet_todoapp"
  subnet_name          = "subnet_backend"
  address_prefixes     = ["10.0.2.0/24"]

}
module "public_ip" {
  
  source               = "../modules/public_ip"
  resource_group_name  = "rg_todoapp"
  location             = "centralindia"
  public_ip_name       = "public_ip_todoapp"
  allocation_method = "Static "
}
module "frontend_vm" {
  depends_on           = [module.frontend_subnet, module.public_ip]
  source               = "../modules/Virtual_machine"
  resource_group_name  = "rg_todoapp"
  location             = "centralindia"
  nic_name             = "nic_frontend"
  vm_name              = "vm_frontend"
  vm_size              = "Standard_B1s"
  admin_username       = "azureuser"
  admin_password       = "Password@!112233"
  subnet_id            = "/subscriptions/ce9b69ad-3548-465b-b661-642ebf28469f/resourceGroups/rg_todoapp/providers/Microsoft.Network/virtualNetworks/vnet_todoapp/subnets/subnet_frontend"
  image_publisher      = "Canonical"
  image_offer          = "ubuntuServer"
  image_sku            = "18.04-lts"
  image_version        = "latest"

}

module "backend_vm" {
  depends_on           = [module.backend_subnet, module.public_ip]
  source               = "../modules/Virtual_machine"
  resource_group_name  = "rg_todoapp"
  location             = "centralindia"
  nic_name             = "nic_backend"
  vm_name              = "vm_backend"
  vm_size              = "Standard_B1s"
  admin_username       = "azureuser"
  admin_password       = "Password@!112233"
  subnet_id            = "/subscriptions/ce9b69ad-3548-465b-b661-642ebf28469f/resourceGroups/rg_todoapp/providers/Microsoft.Network/virtualNetworks/vnet_todoapp/subnets/subnet_backend"
  image_publisher      = "Canonical"
  image_offer          = "0001-com-ubuntu-server-focal"
  image_sku            = "20_04-lts"
  image_version        = "latest"

}
module "sql_database" {
  source               = "../modules/sql_database"
  resource_group_name  = "rg_todoapp"
  sql_server_name      = "sqlserverpkg"
  sql_admin_username   = "sqladmin"
  sql_admin_password   = "Password@!112233"
  sql_database_name    = "sqldbpkg"
  location             = "centralindia"
}