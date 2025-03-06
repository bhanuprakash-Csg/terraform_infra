environment          = "dev"
location            = "Central US"
resource_group_name = "rg-dev_new"

vnet_name           = "vnet-dev"
address_space       = ["10.0.0.0/16"]

public_subnet_name  = "public-subnet-dev"
public_subnet_prefix = ["10.0.1.0/24"]

private_subnet_name  = "private-subnet-dev"
private_subnet_prefix = ["10.0.2.0/24"]

nsg_name            = "nsg-dev"

db_name  = "mysqlfelxiserver-new-dev"
sql_db_admin    = "db-admin"
sql_db_password = "db-password"

mysql_private_dns_zone_name = "privatelink.mysql.database.azure.com"

vm_name             = "vm-dev"
vm_size             = "Standard_B1s"
ec2_admin_username      = "admin-username"
ec2_admin_password      = "admin-password"

nic_name            = "nic-dev"
public_ip_name      = "pip-dev"
private_ip          = "10.0.1.4"
private_subnet_id    = "10.0.2.5"



