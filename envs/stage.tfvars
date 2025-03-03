environment          = "stage"
location            = "Central India"
resource_group_name = "rg-stage"

vnet_name           = "vnet-stage"
address_space       = ["10.1.0.0/16"]

public_subnet_name  = "public-subnet-stage"
public_subnet_prefix = ["10.1.1.0/24"]

private_subnet_name  = "private-subnet-stage"
private_subnet_prefix = ["10.1.2.0/24"]

nsg_name            = "nsg-stage"

db_name          = "mysql-stage-new-myflexiserver12"
db_admin    = "adminuser"
db_password = "SuperSecretPassword456"

mysql_private_dns_zone_name = "privatelink.mysql.database.azure.com"

vm_name             = "vm-stage"
vm_size             = "Standard_D2s_v3"
admin_username      = "azureuser"
admin_password      = "SecureVMPassword456"

nic_name            = "nic-stage"
public_ip_name      = "pip-stage"
private_ip          = "10.1.1.4"
private_subnet_id ="10.1.2.6"
