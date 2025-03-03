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

# Virtual Machine
variable "vm_name" {
  description = "Virtual Machine Name"
  type        = string
}

variable "vm_size" {
  description = "VM Size (e.g., Standard_B1s, Standard_D2s_v3)"
  type        = string
}

variable "admin_username" {
  description = "Admin Username for the VM"
  type        = string
}

variable "admin_password" {
  description = "Admin Password for the VM"
  type        = string
  sensitive   = true
}

# Networking
variable "public_subnet_id" {
  description = "ID of the public subnet where the VM will be deployed"
  type        = string
}

variable "private_ip" {
  description = "Private IP address for the VM"
  type        = string
}

variable "nic_name" {
  description = "Network Interface Card (NIC) Name"
  type        = string
}

# Public IP
variable "public_ip_name" {
  description = "Public IP Name for the VM"
  type        = string
}

