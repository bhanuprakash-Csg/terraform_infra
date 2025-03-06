data "azurerm_key_vault" "example" {
  name                = "azurecredterraform"
  resource_group_name = "Myresourcegroup"
}

data "azurerm_key_vault_secret" "db_password" {
  name         = var.sql_db_password
  key_vault_id = data.azurerm_key_vault.example.id
}

data "azurerm_key_vault_secret" "db_admin" {
  name         = var.sql_db_admin 
  key_vault_id = data.azurerm_key_vault.example.id
}

data "azurerm_key_vault_secret" "admin_username" {
  name         = var.ec2_admin_username
  key_vault_id = data.azurerm_key_vault.example.id
}

data "azurerm_key_vault_secret" "admin_password" {
  name         = var.ec2_admin_password
  key_vault_id = data.azurerm_key_vault.example.id
}
