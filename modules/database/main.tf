resource "azurerm_mysql_flexible_server" "mysql" {
  name                   = var.db_name
  resource_group_name    = var.resource_group_name
  location               = var.location
  administrator_login    = var.db_admin
  administrator_password = var.db_password
  backup_retention_days  = 7
  delegated_subnet_id    =  var.private_subnet_id 
  sku_name               = var.sku_name   # added while doing the plan
  # mysql_private_dns_zone_name = var.mysql_private_dns_zone_name


#  depends_on = [
#   module.networking  # 
# ]

}
