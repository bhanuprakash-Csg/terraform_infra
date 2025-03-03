# Environment
environment         = "dev"
location            = "East US"
resource_group_name = "rg-dev"

# Virtual Network
vnet_name     = "vnet-dev"
address_space = ["10.0.0.0/16"]

# Subnets
public_subnet_name   = "public-subnet-dev"
public_subnet_prefix = ["10.0.1.0/24"]

private_subnet_name   = "private-subnet-dev"
private_subnet_prefix = ["10.0.2.0/24"]

# Network Security Group
nsg_name = "nsg-dev"

# Database
db_name     = "mysql-dev"
db_admin    = "adminuser"
db_password = "SuperSecretPassword123"

# Private DNS Zone for MySQL 
mysql_private_dns_zone_name = "privatelink.mysql.database.azure.com"

# Virtual Machine
vm_name        = "vm-dev"
vm_size        = "Standard_B1s"
admin_username = "azureuser"
admin_password = "SecureVMPassword123"

# Networking
nic_name       = "nic-dev"
public_ip_name = "pip-dev"
private_ip     = "10.0.1.4"
private_subnet_id= "10.0.2.4"
