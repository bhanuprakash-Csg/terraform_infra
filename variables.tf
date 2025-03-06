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

# Networking
variable "vnet_name" {
  description = "Virtual Network Name"
  type        = string
}

variable "address_space" {
  description = "Address space for the VNet"
  type        = list(string)
}

variable "public_subnet_name" {
  description = "Public Subnet Name"
  type        = string
}

variable "public_subnet_prefix" {
  description = "Public Subnet CIDR"
  type        = list(string)
}

variable "private_subnet_name" {
  description = "Private Subnet Name"
  type        = string
}

variable "private_subnet_prefix" {
  description = "Private Subnet CIDR"
  type        = list(string)
}

# Network Security Group (NSG)
variable "nsg_name" {
  description = "Name of the Network Security Group"
  type        = string
}


# adding  private Ip 
variable "private_ip" {
  description = "Private IP for the VM"
  type        = string
}

# Compute (VM)
variable "vm_name" {
  description = "Virtual Machine Name"
  type        = string
}

variable "vm_size" {
  description = "VM Size"
  type        = string
}

variable "ec2_admin_username" {
  description = "Admin username for the VM"
  type        = string
}

variable "ec2_admin_password" {
  description = "Admin password for the VM"
  type        = string
  sensitive   = true
}

variable "nic_name" {
  description = "Network Interface Name"
  type        = string
}

variable "public_ip_name" {
  description = "Public IP Name for the VM"
  type        = string
}

# Database
variable "db_name" {
  description = "MySQL Flexible Server Name"
  type        = string
  sensitive = true
}
variable "db_admin" {
  description = "MySQL Admin Username"
  type        = string
  sensitive =  true
}

variable "db_password" {
  description = "MySQL Admin Password"
  type        = string
  sensitive   = true
}

variable "sql_db_admin" {
  description = "MySQL Admin Username"
  type        = string
  sensitive = true
}

variable "sql_db_password" {
  description = "MySQL Admin Password"
  type        = string
  sensitive   = true
}

variable "mysql_private_dns_zone_name" {
  description = "Private DNS Zone for MySQL"
  type        = string
  default     = "privatelink.mysql.database.azure.com"
}

# Private Subnet ID for Database
variable "private_subnet_id" {
  description = "ID of the private subnet where MySQL will be deployed"
  type        = string
}


