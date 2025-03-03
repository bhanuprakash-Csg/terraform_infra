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

# Virtual Network
variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
}

variable "address_space" {
  description = "VNet address space"
  type        = list(string)
}

# Public Subnet
variable "public_subnet_name" {
  description = "Public Subnet Name"
  type        = string
}

variable "public_subnet_prefix" {
  description = "Public Subnet CIDR"
  type        = list(string)
}

# Private Subnet
variable "private_subnet_name" {
  description = "Private Subnet Name"
  type        = string
}

variable "private_subnet_prefix" {
  description = "Private Subnet CIDR"
  type        = list(string)
}

# Network Security Group
variable "nsg_name" {
  description = "NSG Name"
  type        = string
}

# Private DNS Zone
variable "mysql_private_dns_zone_name" {
  description = "Private DNS Zone for MySQL"
  type        = string
  default     = "privatelink.mysql.database.azure.com"
}

variable "private_ip" {
  description = "Private IP address for the VM"
  type        = string
}
