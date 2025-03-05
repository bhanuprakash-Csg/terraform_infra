terraform {
  backend "azurerm" {
    resource_group_name ="Mystorageaccount"
    storage_account_name = "backendterraform123"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
    # use_azuread_auth     = true 
  }
}
