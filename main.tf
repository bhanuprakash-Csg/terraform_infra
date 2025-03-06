# Create Resource Group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# Module: Networking
module "networking" {
  source                      = "./modules/networking"
  environment                 = var.environment
  resource_group_name         = azurerm_resource_group.rg.name
  location                    = var.location
  vnet_name                   = var.vnet_name
  address_space               = var.address_space
  public_subnet_name          = var.public_subnet_name
  public_subnet_prefix        = var.public_subnet_prefix
  private_subnet_name         = var.private_subnet_name
  private_subnet_prefix       = var.private_subnet_prefix
  nsg_name                    = var.nsg_name
  mysql_private_dns_zone_name = var.mysql_private_dns_zone_name
  private_ip                  = var.private_ip

  depends_on = [azurerm_resource_group.rg] # Ensure RG is created before networking
}

# Module: Compute (Virtual Machine)
module "compute" {
  source              = "./modules/compute"
  environment         = var.environment
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  vm_name             = var.vm_name
  vm_size             = var.vm_size
  admin_username      = data.azurerm_key_vault_secret.admin_username.value
  admin_password      = data.azurerm_key_vault_secret.admin_password.value
  nic_name            = var.nic_name
  public_ip_name      = var.public_ip_name
  public_subnet_id    = module.networking.public_subnet_id
  private_ip          = var.private_ip

  depends_on = [module.networking] # Ensure networking is created before VM
}

# Module: Database (MySQL Flexible Server)
module "database" {
  source                      = "./modules/database"
  environment                 = var.environment
  resource_group_name         = azurerm_resource_group.rg.name
  location                    = var.location
  db_name                     = var.db_name
  db_admin                    = data.azurerm_key_vault_secret.db_admin.value
  db_password                 = data.azurerm_key_vault_secret.db_password.value
  private_subnet_id           = module.networking.private_subnet_id
  mysql_private_dns_zone_name = module.networking.mysql_private_dns_zone_name

  depends_on = [module.networking, module.compute] # Ensure networking & compute exist before DB
}
