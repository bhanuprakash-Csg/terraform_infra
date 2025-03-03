# Environment
variable "environment" {
  description = "Deployment environment (dev, stage, prod)"
  type        = string
}

# Azure Region
variable "location" {
  description = "Azure region"
  type        = string
}

# Resource Group
variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
}

# MySQL Database
variable "db_name" {
  description = "MySQL Server Name"
  type        = string
}

variable "db_admin" {
  description = "MySQL Admin Username"
  type        = string
}

variable "db_password" {
  description = "MySQL Admin Password"
  type        = string
  sensitive   = true
}

# Networking

# MySQL SKU
variable "sku_name" {
  description = "SKU Name for MySQL Flexible Server (e.g., GP_Standard_D2ds_v4)"
  type        = string
  default     = "GP_Standard_D2ds_v4"
}

variable "mysql_private_dns_zone_name" {
  description = "Private DNS Zone for MySQL"
  type        = string
}

variable "private_subnet_id" {
  description = "ID of the private subnet for MySQL"
  type        = string
}

