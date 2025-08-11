variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The Azure region for the resources."
  type        = string
}

variable "sql_server_name" {
  description = "Unique name for the SQL Server."
  type        = string
}

variable "sql_admin_username" {
  description = "Admin username for the SQL Server."
  type        = string
}

variable "sql_admin_password" {
  description = "Admin password for the SQL Server."
  type        = string
  sensitive   = true
}

variable "sql_database_name" {
  description = "Name of the SQL Database."
  type        = string
}

