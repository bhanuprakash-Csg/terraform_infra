
# Outputs
output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}

output "public_subnet_id" {
  value = azurerm_subnet.public_subnet.id
}

output "private_subnet_id" {
  value = azurerm_subnet.private_subnet.id
}

output "nsg_id" {
  value = azurerm_network_security_group.nsg.id
}
output "mysql_private_dns_zone_name" {
  description = "Private DNS Zone Name for MySQL"
  value       = azurerm_private_dns_zone.mysql_private_dns.name
}

